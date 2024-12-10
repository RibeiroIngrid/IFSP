using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SignUpController : ControllerBase
    {
        private readonly ILogger<SignUpController> _logger;
        private readonly FakeDatabase _fakeDatabase;

        public SignUpController(ILogger<SignUpController> logger)
        {
            _logger = logger;
            _fakeDatabase = FakeDatabase.Instance;
        }

        [HttpGet("GetAllUsers")]
        public ActionResult<IEnumerable<User>> GetAllUsers()
        {
            return Ok(_fakeDatabase.Users);
        }

        [HttpGet("GetUserById/{id}")]
        public ActionResult<User> GetUserById(int id)
        {
            var user = _fakeDatabase.Users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpGet("GetUserByName/{name}")]
        public ActionResult<User> GetUserByName(string name)
        {
            var user = _fakeDatabase.Users.FirstOrDefault(u => u.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost("CreateUser")]
        public ActionResult CreateUser([FromBody] User newUser)
        {
            if (_fakeDatabase.Users.Any(u => u.Id == newUser.Id))
            {
                return BadRequest("User with the same ID already exists.");
            }

            _fakeDatabase.Users.Add(newUser);
            return CreatedAtAction(nameof(GetUserById), new { id = newUser.Id }, newUser);
        }

        [HttpDelete("DeleteUserById/{id}")]
        public ActionResult DeleteUserById(int id)
        {
            var user = _fakeDatabase.Users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }

            _fakeDatabase.Users.Remove(user);
            return NoContent();
        }

        [HttpPost("login/{userId}")]
        public IActionResult Login(int userId)
        {
            var user = _fakeDatabase.Users.FirstOrDefault(u => u.Id == userId);
            if (user == null)
            {
                return NotFound("User not found");
            }

            if (_fakeDatabase.LoggedOn.Contains(userId))
            {
                return BadRequest("User already logged in.");
            }
            else
            {
                _fakeDatabase.LoggedOn.Add(userId);
            }
            return Ok(new { Message = "User logged in successfully", User = user });
        }

        [HttpGet("GetAllLoggedInUsers")]
        public ActionResult<IEnumerable<User>> GetAllLoggedInUsers()
        {
            var loggedInUsers = _fakeDatabase.Users
                .Where(u => _fakeDatabase.LoggedOn.Contains(u.Id))
                .ToList();

            return Ok(loggedInUsers);
        }
    }
}