using NUnit.Framework;

namespace AzureDevopsSampleTests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            var expectation = "Hello World";
            var actual = "Hello World";
            Assert.AreSame(expectation, actual);
        }
    }
}