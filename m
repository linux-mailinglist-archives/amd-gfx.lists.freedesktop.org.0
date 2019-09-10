Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B8AF165
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6896E952;
	Tue, 10 Sep 2019 19:04:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5D56E953
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPBNtrCJEDajCSzUtT91JD2JRQb+Qeqxo0AxjSRpXuPXe4pTANxmVDGLLOEM/uHuV+78VqjeRyeMGqi4/ZIOXbTszRPQOdcx2XgCnqFada0gvBW6jk9dTNCbWNq2HzPnaf/9DyzxRYJhYiCqxDyAalUAraJQN2IzK57JVxAsWqF5eXRQh6X3UptbrxglgkeesBYp6dmYJ761Znb4YjqjsXrS+WMfAFAp9NebQdUPZnAfjDsIOjz04HacWxra51XaTgwbQvfInbKha/Rd+L5K2+9qpgId10w7gMi9Y8k9dL4ltdOvYTgRBrGsU3msOl8UlEdFrd6wEQCNV8akHnfn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0+k2Oila9Rw5MVzt0U8Xe8VulEhNLsPYd/bqI6aQJY=;
 b=CDxmmHOyhsSuBz/so7fufp6IVVzr8W7dontX27sXRa0i3fCtG+UAoRw6ep/QCaZVjQsty/1Rba0D0nANBP7k4hPS6x168TdJsOEonNhpHalGRZ8vw7OkHv6wafDd2Mw93IPAwJiyw3pEFMfBDrJjJN5w5qfPE4483hMkSWyPDN3E6oHdI7tW+qf5OAxQP1D8qCOa5dj3xXrv2FV3R+Y/8483P/nSlbnzK6qjiRd3NTXazDXiDLUH97YWFPwuH754HT3jg4A68HkEy9EjsedtYS/PSYXaAVs3VYR5fPcNYpkM/j6uLFwibACnrIpu7mtOAIrkNxg8PBtE9C4NgJ+/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0017.namprd12.prod.outlook.com (2603:10b6:403:2::27)
 by BN8PR12MB3060.namprd12.prod.outlook.com (2603:10b6:408:4a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:04:30 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN4PR12CA0017.outlook.office365.com
 (2603:10b6:403:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:29 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:28 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/20] drm: generic fn converting be24 to cpu and vice versa
Date: Tue, 10 Sep 2019 15:04:04 -0400
Message-ID: <20190910190422.794-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(47776003)(54906003)(81166006)(81156014)(8676002)(305945005)(316002)(14444005)(1076003)(478600001)(4326008)(966005)(16586007)(76176011)(7696005)(51416003)(50466002)(2906002)(48376002)(36756003)(5660300002)(86362001)(6306002)(11346002)(6916009)(6666004)(336012)(2351001)(186003)(356004)(70586007)(70206006)(446003)(486006)(26005)(476003)(2616005)(426003)(126002)(53936002)(53416004)(8936002)(50226002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3060; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb896659-8872-4de5-f351-08d73621b539
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN8PR12MB3060; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3060:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN8PR12MB30606AD0B35738B46B02B52AF9B60@BN8PR12MB3060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: poCSLeWl55pwrl50gjYfvyAnvf4o90Ein1UkHkFtQCui2V4qvib/2G99crX94gsViIF2rsWJXMqM/L6zwF/agR7g81GY/MFyeQmhT1zfgNpSKha4Z95JfeB8xVMGY/M9aDooGxdSoR9x3tOsa1CIX6ETbXkH+DfW2MT5YnI+ShYnh4XCQEPkIbT76SeK0d3jLQaDf9AXl0tCk08b4t6+PPWtdrsg/4Bdecc0cVBVNszzyjF8+Adl1PzzGpvwYDONCcrYdgEeHImNsDz2WJEfOdGJ4Z5RalYLIckJkh8DYKpjD6edjl24n4Mxx1xeL78MkYIU/Gjlor4hRJzlhvIJyBlltc0gcnDzqKkOE6Xud1rfw3oApKy88Ek4xjGXCQW28z4JvAYATEwhJquS1C7YGKkik8aTdshxC1UCBPmjXpc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:29.6347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb896659-8872-4de5-f351-08d73621b539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0+k2Oila9Rw5MVzt0U8Xe8VulEhNLsPYd/bqI6aQJY=;
 b=rQj5gvL97DKFEFZbPtTYfVt5zb9ErU3uUAHk/xDxSttteKKeRc/zFFuokP3AHKbliAoK2SFOgUylken0zx5R3QtUl+Ktf7l/aWiHCGFj88t8paTr38obxVLf7YsG4suWf/J4n8SGwCrGpRoxxcvp9+E+a7sObBwUuF6Z0nhoeO8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Ramalingam C <ramalingam.c@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgoKRXhpc3RpbmcgZnVu
Y3Rpb25zIGZvciBjb252ZXJ0aW5nIGEgM2J5dGVzKGJlMjQpIG9mIGJpZyBlbmRpYW4gdmFsdWUK
aW50byB1MzIgb2YgbGl0dGxlIGVuZGlhbiBhbmQgdmljZSB2ZXJzYSBhcmUgcmVuYW1lZCBhcwoK
cy9kcm1faGRjcDJfc2VxX251bV90b191MzIvZHJtX2hkY3BfYmUyNF90b19jcHUKcy9kcm1faGRj
cDJfdTMyX3RvX3NlcV9udW0vZHJtX2hkY3BfY3B1X3RvX2JlMjQKClNpZ25lZC1vZmYtYnk6IFJh
bWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KU3VnZ2VzdGVkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CmNjOiBUb21hcyBXaW5rbGVyIDx0b21hcy53aW5rbGVy
QGludGVsLmNvbT4KQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KTGluazog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTA3MTYy
NzQ1LjI1NjAwLTQtcmFtYWxpbmdhbS5jQGludGVsLmNvbQotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX2hkY3AuYyB8IDUgKysrLS0KIGRyaXZlcnMvbWlzYy9tZWkvaGRjcC9tZWlfaGRj
cC5jICB8IDIgKy0KIGluY2x1ZGUvZHJtL2RybV9oZGNwLmggICAgICAgICAgICB8IDQgKystLQog
MyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRjcC5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfaGRjcC5jCmluZGV4IDk5YjAwNzE2OWM0OS4uNTM2Y2RkYzc0ZDIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZGNwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfaGRjcC5jCkBAIC0xMzA2LDcgKzEzMDYsNyBAQCBpbnQgaGRjcDJf
cHJvcGFnYXRlX3N0cmVhbV9tYW5hZ2VtZW50X2luZm8oc3RydWN0IGludGVsX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQogCiAJLyogUHJlcGFyZSBSZXBlYXRlckF1dGhfU3RyZWFtX01hbmFnZSBtc2cg
Ki8KIAltc2dzLnN0cmVhbV9tYW5hZ2UubXNnX2lkID0gSERDUF8yXzJfUkVQX1NUUkVBTV9NQU5B
R0U7Ci0JZHJtX2hkY3AyX3UzMl90b19zZXFfbnVtKG1zZ3Muc3RyZWFtX21hbmFnZS5zZXFfbnVt
X20sIGhkY3AtPnNlcV9udW1fbSk7CisJZHJtX2hkY3BfY3B1X3RvX2JlMjQobXNncy5zdHJlYW1f
bWFuYWdlLnNlcV9udW1fbSwgaGRjcC0+c2VxX251bV9tKTsKIAogCS8qIEsgbm8gb2Ygc3RyZWFt
cyBpcyBmaXhlZCBhcyAxLiBTdG9yZWQgYXMgYmlnLWVuZGlhbi4gKi8KIAltc2dzLnN0cmVhbV9t
YW5hZ2UuayA9IGNwdV90b19iZTE2KDEpOwpAQCAtMTM3MSw3ICsxMzcxLDggQEAgaW50IGhkY3Ay
X2F1dGhlbnRpY2F0ZV9yZXBlYXRlcl90b3BvbG9neShzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpj
b25uZWN0b3IpCiAJfQogCiAJLyogQ29udmVydGluZyBhbmQgU3RvcmluZyB0aGUgc2VxX251bV92
IHRvIGxvY2FsIHZhcmlhYmxlIGFzIERXT1JEICovCi0Jc2VxX251bV92ID0gZHJtX2hkY3AyX3Nl
cV9udW1fdG9fdTMyKG1zZ3MucmVjdmlkX2xpc3Quc2VxX251bV92KTsKKwlzZXFfbnVtX3YgPQor
CQlkcm1faGRjcF9iZTI0X3RvX2NwdSgoY29uc3QgdTggKiltc2dzLnJlY3ZpZF9saXN0LnNlcV9u
dW1fdik7CiAKIAlpZiAoc2VxX251bV92IDwgaGRjcC0+c2VxX251bV92KSB7CiAJCS8qIFJvbGwg
b3ZlciBvZiB0aGUgc2VxX251bV92IGZyb20gcmVwZWF0ZXIuIFJlYXV0aGVudGljYXRlLiAqLwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmMgYi9kcml2ZXJzL21p
c2MvbWVpL2hkY3AvbWVpX2hkY3AuYwppbmRleCBiMDcwMDAyMDJkNGEuLjQxNzg2NTEyOTQwNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmMKKysrIGIvZHJpdmVy
cy9taXNjL21laS9oZGNwL21laV9oZGNwLmMKQEAgLTU3Niw3ICs1NzYsNyBAQCBzdGF0aWMgaW50
IG1laV9oZGNwX3ZlcmlmeV9tcHJpbWUoc3RydWN0IGRldmljZSAqZGV2LAogCiAJbWVtY3B5KHZl
cmlmeV9tcHJpbWVfaW4ubV9wcmltZSwgc3RyZWFtX3JlYWR5LT5tX3ByaW1lLAogCSAgICAgICBI
RENQXzJfMl9NUFJJTUVfTEVOKTsKLQlkcm1faGRjcDJfdTMyX3RvX3NlcV9udW0odmVyaWZ5X21w
cmltZV9pbi5zZXFfbnVtX20sIGRhdGEtPnNlcV9udW1fbSk7CisJZHJtX2hkY3BfY3B1X3RvX2Jl
MjQodmVyaWZ5X21wcmltZV9pbi5zZXFfbnVtX20sIGRhdGEtPnNlcV9udW1fbSk7CiAJbWVtY3B5
KHZlcmlmeV9tcHJpbWVfaW4uc3RyZWFtcywgZGF0YS0+c3RyZWFtcywKIAkgICAgICAgKGRhdGEt
PmsgKiBzaXplb2Yoc3RydWN0IGhkY3AyX3N0cmVhbWlkX3R5cGUpKSk7CiAKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9oZGNwLmggYi9pbmNsdWRlL2RybS9kcm1faGRjcC5oCmluZGV4IGYy
NDM0MDhlY2YyNi4uMWNjNjZkZjA1YTQzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1faGRj
cC5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9oZGNwLmgKQEAgLTI1MiwxMyArMjUyLDEzIEBAIHN0
cnVjdCBoZGNwMl9yZXBfc3RyZWFtX3JlYWR5IHsKICAqIGhvc3QgZm9ybWF0IGFuZCBiYWNrCiAg
Ki8KIHN0YXRpYyBpbmxpbmUKLXUzMiBkcm1faGRjcDJfc2VxX251bV90b191MzIodTggc2VxX251
bVtIRENQXzJfMl9TRVFfTlVNX0xFTl0pCit1MzIgZHJtX2hkY3BfYmUyNF90b19jcHUoY29uc3Qg
dTggc2VxX251bVtIRENQXzJfMl9TRVFfTlVNX0xFTl0pCiB7CiAJcmV0dXJuICh1MzIpKHNlcV9u
dW1bMl0gfCBzZXFfbnVtWzFdIDw8IDggfCBzZXFfbnVtWzBdIDw8IDE2KTsKIH0KIAogc3RhdGlj
IGlubGluZQotdm9pZCBkcm1faGRjcDJfdTMyX3RvX3NlcV9udW0odTggc2VxX251bVtIRENQXzJf
Ml9TRVFfTlVNX0xFTl0sIHUzMiB2YWwpCit2b2lkIGRybV9oZGNwX2NwdV90b19iZTI0KHU4IHNl
cV9udW1bSERDUF8yXzJfU0VRX05VTV9MRU5dLCB1MzIgdmFsKQogewogCXNlcV9udW1bMF0gPSB2
YWwgPj4gMTY7CiAJc2VxX251bVsxXSA9IHZhbCA+PiA4OwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
