Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F78AF190
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E9E6E968;
	Tue, 10 Sep 2019 19:06:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74966E96B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EadnBtUH2MdSPduRDylM6JpbIGgvcGNgDyF8EWiuqqqXieWO57dCU3+tnGl1DNbj/qzOI+KU0ji8t+9jkDlhzhkaMmDKD9THvVcmhFTudCN069FcjyUtkH0P/8HcboK1knV4TUayL2X8wg5kTCxU98usRpWTXcMB/o4HLoItl9RpqsvdTX7E1Z47EibFVtn3UOyuOnCh95sdV2FZcMH2cxOUsXwjU7wBXqHQuTg9X3dt4PjFRy0M9CDnWA1NJ4JvQyLwgQZcpjhm1MTFM83lSbV7nAzY1yPniSl87AlML2zjtLJdqX4VAovFphvP0pQXjkrgviPLqZ5CNx0LFzZxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0+k2Oila9Rw5MVzt0U8Xe8VulEhNLsPYd/bqI6aQJY=;
 b=E375/n611wgb62KDztHyQqN66cK9cLt3Ot43x26xvwXhWw4Elj4WAVrOJxgCFJj9w0F+cX7hSPiqODdggUVW8bDhlevtUBjILEdVmH2eb+fVrVaU0poM0GLdqi8OYaSfudzrtf3AXX1X+Ge5DdI2qOTFXZAMMVQPrFQ2/N9aBpTRkB1AUccnn43ZxTm8HwQNYfRETUFtTPiLOfQcjO+nL+7rGFMSCSOEanHUANCMRMc4DILUrfyAGdp5O+VhqYKIYzcRFsdemlHj40Mtk7u7jbHv/30YrdSA6Z6HYN63KDZrhMSKpkV0dGWkBEG51yBT7+xhhkDwYSVvQAZNDN4vaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by MWHPR12MB1342.namprd12.prod.outlook.com
 (2603:10b6:300:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.17; Tue, 10 Sep
 2019 19:06:15 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:14 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:14 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/20] drm: generic fn converting be24 to cpu and vice versa
Date: Tue, 10 Sep 2019 15:05:36 -0400
Message-ID: <20190910190554.1539-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(428003)(189003)(199004)(26005)(186003)(53936002)(6306002)(7696005)(316002)(16586007)(54906003)(966005)(6666004)(47776003)(70206006)(86362001)(53416004)(356004)(4326008)(70586007)(305945005)(8936002)(81166006)(81156014)(8676002)(50226002)(6916009)(36756003)(51416003)(48376002)(1076003)(76176011)(14444005)(50466002)(126002)(486006)(11346002)(446003)(2906002)(2616005)(476003)(426003)(478600001)(336012)(2351001)(5660300002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1342; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06e496a-9ace-43c2-9d9f-08d73621f404
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1342; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1342:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <MWHPR12MB1342DB70FF533DCC5C9BD8C3F9B60@MWHPR12MB1342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6XqXkDfs/kGZecmzUqD+SmJo+O/C+/W004UmmqrMAgz4BDoKs4ymwnvm0ddGLL9OYgDZjkTnwvDehBvNX0OboXptvuGS1dQYpvE+elNDQnPopoY9INrRgQzijByayep80Hx+NKMFnbAc0Pst3qX0M1WtSfwlM4HbIySDY/OOb8DeOetCLN+yszg9KxOJADglMcS4R6OX9kAsh73T3xdpIlEz33K1ixzx9T0clSlON+o7jDoUC5AVwketUE5vrvOjUr12ct6qEustUP45eDBG62FlZ5hOh1MWZzb6BRP4x5IpHpK9vgvtEWqzGoh84JAbvtV0TSEeK6cQKaE75YLSvGIiOm24fpipUd2EcNig9wOlOp/WRR+omVDAdUl6MACGNqBo69hUfRPI5mZNQqLlEFD44ZNW/uIdBsO4UxpBeP4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:14.9776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c06e496a-9ace-43c2-9d9f-08d73621f404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0+k2Oila9Rw5MVzt0U8Xe8VulEhNLsPYd/bqI6aQJY=;
 b=Rmxbs3kPnlOfZtw6NivP2V1CgqJvvfpLOL/S7yFLcFxINDbUDu/wRydxmwxDYOt9zQU6c+7CTzpSgFrGUqqxwX4HlpuA/R5y3oCMkrUdj8C9fP7iZ/x3Jqkh4AJNjKYhjQjV09DkzY2rza3UMHlyrZIzgFiWQvRsfJnKJC4nxR8=
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
