Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D537F02
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956478984E;
	Thu,  6 Jun 2019 20:55:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9578984E
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:06 +0000 (UTC)
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 20:55:04 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:04 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:03 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/24] DC Patches 06 Jun 2019
Date: Thu, 6 Jun 2019 16:54:37 -0400
Message-ID: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(336012)(70586007)(77096007)(26005)(5660300002)(70206006)(356004)(186003)(486006)(86362001)(2616005)(126002)(53936002)(426003)(476003)(36756003)(72206003)(478600001)(6916009)(305945005)(7696005)(2351001)(16586007)(316002)(50466002)(48376002)(51416003)(2906002)(6666004)(47776003)(14444005)(1076003)(53416004)(81166006)(68736007)(81156014)(8676002)(4326008)(8936002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2060aa45-4abd-4d14-16a5-08d6eac13ff7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12655782F278A6CF945AD0D5F9170@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JuF1pYiqqByqBZBOLMx8bTbR69C4WG33PivnmrteTWwxOXOIkfeJ2QW2SzCgZjrj71T9nEMAbSYkZb6iuqj1UOvKGoS3B1OK9N7O5euMF4MZK6UBkRaTfpUfUCybhmNg1HrVf7m37d1opzBW3SnQXmyTctlujHOrMXPND7ZAJkRIStEWd3A3BxmPGiAnO5XVTMVZH/43/xCFJYvxpVXBXQOrq030muK6e01vx3yj/ghzm4oTYHiiFZ0dKHD+CNu45e/TXy1c+NKfUrY9eONbRVkjkVciV9dt0vahWGuh5Zvp3XPQPIN9kyzTq+kuq2xfsLO38KS2KXvZ+MBnW9UEMcYhAH3yRryNRr689zDXIZYtnFvjoONPUWyfJwXWjq09fYSaO9qXWQ4jicBj4XE24TVE6BYetgPl679NCcrFFso=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:04.1148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2060aa45-4abd-4d14-16a5-08d6eac13ff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kHqDwzYNW2vTtR7u9Xhmsw1C/AcERJPQSH71dCm/SI=;
 b=DPH1DwjRCQZeQCgT0pnEtWd/hntUlC+9wgrbfaArY8gk3kT1RjkIybRGmyktu50SzoYIZ0pSk1AXvT4qkCEmsiubvBfHuv7MxHu+yPNZ0lENTuBxN6PoSpoIRpJV7pZ3ndQ8wQ8R6Xt3KFeBfbNh70Pn2rjbiZcFa2YyHC1pcKw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VtbWFyeSBPZiBDaGFuZ2VzCipSZXdvcmsgQ1JUQyBjb2xvciBtYW5hZ2VtZW50CipBZGQgdW5k
ZXJmbG93IGFzc2VydHMKKmkyYyBmaXgKKmdhbW1hIGZpeGVzCgpBbnRob255IEtvbyAoMSk6CiAg
ZHJtL2FtZC9kaXNwbGF5OiBmaXggaXNzdWUgd2l0aCBlRFAgbm90IGRldGVjdGVkIG9uIGRyaXZl
ciBsb2FkCgpBcmljIEN5ciAoMyk6CiAgZHJtL2FtZC9kaXNwbGF5OiAzLjIuMzMKICBkcm0vYW1k
L2Rpc3BsYXk6IDMuMi4zNAogIGRybS9hbWQvZGlzcGxheTogMy4yLjM1CgpDaGFybGVuZSBMaXUg
KDIpOgogIGRybS9hbWQvZGlzcGxheTogYWRkIHNvbWUgbWF0aCBmdW5jdGlvbnMgZm9yIGRjbl9j
YWxjX21hdGgKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBhdWRpbyByZWxhdGVkIHJlZ3MKCkNocmlz
IFBhcmsgKDEpOgogIGRybS9hbWQvZGlzcGxheTogQ2xlYW4gdXAgc2NkY190ZXN0X2RhdGEgc3Ry
dWN0CgpEZXJlayBMYWkgKDEpOgogIGRybS9hbWQvZGlzcGxheTogYWRkIGkyY19od19TdGF0dXMg
Y2hlY2sgdG8gbWFrZSBzdXJlIGFzIEhXIEkyYyBpbiB1c2UKCkRteXRybyBMYWt0eXVzaGtpbiAo
MSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBtb3ZlIHZtaWQgZGV0ZXJtaW5hdGlvbiBsb2dpYyBvdXQg
b2YgZGMKCkVyaWMgQmVybnN0ZWluICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IERvbnQgYXNlciBp
ZiBEUF9EUEhZX0lOVEVSTkFMX0NUUkwKCkhhcm1hbnByaXQgVGF0bGEgKDEpOgogIGRybS9hbWQv
ZGlzcGxheTogR2FtbWEgbG9naWMgbGltaXRhdGlvbnMgY2F1c2luZyB1bmludGVuZGVkIHVzZSBv
ZiBSQU0KICAgIG92ZXIgUk9NLgoKSm9yZGFuIExhemFyZSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5
OiBSZW1vdmUgc3VwZXJmbG91cyBlcnJvciBtZXNzYWdlCgpLcnVub3NsYXYgS292YWMgKDEpOgog
IGRybS9hbWQvZGlzcGxheTogZml4IGdhbW1hIGxvZ2ljIGJyZWFraW5nIGRyaXZlciB1bmxvYWQK
Ck5pY2hvbGFzIEthemxhdXNrYXMgKDIpOgogIGRybS9hbWQvZGlzcGxheTogQ29weSBzdHJlYW0g
dXBkYXRlcyBvbnRvIHN0cmVhbXMKICBkcm0vYW1kL2Rpc3BsYXk6IFJld29yayBDUlRDIGNvbG9y
IG1hbmFnZW1lbnQKClNhbXNvbiBUYW0gKDEpOgogIGRybS9hbWQvZGlzcGxheTogc2V0IGxpbmst
PmRvbmdsZV9tYXhfcGl4X2NsayB0byAwIG9uIGEgZGlzY29ubmVjdAoKU2l2YXBpcml5YW5LdW1h
cmFzYW15ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IFMzIFJlc3VtZSB0aW1lIGluY3JlYXNlIGFm
dGVyIGRlY291cGxpbmcgRFBNUyBmcm9tCiAgICBmYXN0IGJvb3QKClN1IFN1bmcgQ2h1bmcgKDEp
OgogIGRybS9hbWQvZGlzcGxheTogbWFrZSBjbGtfbWdyIGNhbGwgZW5hYmxlX3BtZV93YQoKVGFv
Lkh1YW5nICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCByZXNvdXJjZSBzYXZpbmcgbWlzc2lu
ZyB3aGVuIHBvd2VyIHN0YXRlIHN3aXRjaAoKVGhvbWFzIExpbSAoMSk6CiAgZHJtL2FtZC9kaXNw
bGF5OiBBZGQgVW5kZXJmbG93IEFzc2VydHMgdG8gZGMKCldlc2xleSBDaGFsbWVycyAoMyk6CiAg
ZHJtL2FtZC9kaXNwbGF5OiBVcGRhdGUgbGluayByYXRlIGZyb20gRFBDRCAxMAogIGRybS9hbWQv
ZGlzcGxheTogVXNlIG1hY3JvIGZvciBpbnZhbGlkIE9QUCBJRAogIGRybS9hbWQvZGlzcGxheTog
VXNlIHN0cmVhbSBvcHBfaWQgaW5zdGVhZCBvZiBodWJwCgphYmRvdWxheWUgYmVydGhlICgxKToK
ICBkcm0vYW1kL2Rpc3BsYXk6IERvIG5vdCBncmFudCBQT1NUX0xUX0FESiB3aGVuIFRQUzQgaXMg
dXNlZAoKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAz
MiArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgIDEw
ICstCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jICAgfCA0NzMg
KysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvTWFrZWZp
bGUgICAgICAgfCAgIDQgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNf
bWF0aC5jICB8ICAyMCArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjX21h
dGguaCAgfCAgIDMgKwogLi4uL2Rpc3BsYXkvZGMvY2xrX21nci9kY24xMC9ydjFfY2xrX21nci5j
ICAgIHwgIDE0ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAg
ICB8ICA4MiArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
YyB8ICA1MSArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5j
IHwgIDE0ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyAg
fCAgNjUgKy0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfdm1faGVscGVyLmMgICAg
fCAxMjMgLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAgICAgICAg
ICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2h3X3R5cGVzLmgg
IHwgICA2ICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYyAgICB8
ICAgNCArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5oICAgIHwg
ICA3ICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMgICB8ICA2
NSArKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmggICB8ICAg
NSArCiAuLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jICAgfCAgNjAg
Ky0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgfCAgIDcg
Ky0KIC4uLi9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8ICA0MSAr
LQogLi4uL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5oIHwgICAyICsK
IC4uLi9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9saW5rX2VuY29kZXIuYyB8ICAgNCArLQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jIHwgICA0ICstCiAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kbWxfaW5saW5lX2RlZnMuaCAgfCAgIDggKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9odWJwLmggIHwgICA1ICstCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3ZtaWQuaCAgfCAgIDEgKwogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3X3NlcXVlbmNlci5oIHwgICAxICsKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy92bV9oZWxwZXIuaCAgICB8ICAxNiArLQogLi4uL2FtZC9k
aXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyAgIHwgICA1ICstCiAzMCBmaWxlcyBj
aGFuZ2VkLCA3MTUgaW5zZXJ0aW9ucygrKSwgNDIxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3ZtX2hlbHBlci5j
CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
