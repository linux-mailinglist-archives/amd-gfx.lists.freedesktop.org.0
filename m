Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62BC3A42
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 18:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2866E85E;
	Tue,  1 Oct 2019 16:17:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237556E85C;
 Tue,  1 Oct 2019 16:17:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9EAD0Qm8afvdChnofC2sF6uK9ImHhEMS6mvFX6fDjjzeu8OzeMiKLxBXzElCYpfhajhpgNa3FkKPHQla+g+aqX1AzktnLtFtJug1YOdfqgPMT0Gx/TpwWetp6PFmjir7oFaUY/qAed6WrpsToCIqiF4Umj8Y/jxwvQGx0O0HeZF0qzrog0ZJ2GHdPRaZWkEj5uBDmafr1z3DYLAnhMjR7OeBf0kWacRexbkjKKNmZhBoh20sBDPSt81jn+/FItZHUp8pM7OrxH6GFDisxy+NE7A6CZnt1bEoAxTD+KqJmixxP8Oqo2orbSLopeHm8WTw4B6PYrwGg6J+3xULnjoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agOJCQWCcFpY+X91yX0TDqkWQaOPs1wmytUzsXC52TI=;
 b=PtxI2ES15neZJME4b1G3Sz9CvjJHnkCfT09+eNMaXCTF3LddaT8CeiPVeTZNwjXwxbDJ9ytWVZ7zjVRKInXJXzM+5DnWfOoe5vkIKKwuQcOoaGlROr+h4lkJiWuVEi2CFaH/fH44jjkdZ/NDrBv0E3yVx4UqIhiuqynlv0zXtEQrSGwxDiZO1IpJ3c4nVpHE7Squ6pCS6Jdcu7+svQxEWNitN2RkGSMSAnutWu0PC15yWa7ZuRzcZ5f8eMyctuDn4NbxigHmOvK6jPGBREow5jrmrHW41lOkPu55aW13nwyn2waJUkyywpJ1BC4Pwh3pbAScbv3/rOqc+0XTKXyKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 CY4PR12MB1143.namprd12.prod.outlook.com (2603:10b6:903:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 16:17:47 +0000
Received: from CO1NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT051.mail.protection.outlook.com (10.152.80.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:46 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:38 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/14] drm/amd/display: MST DSC compute fair share
Date: Tue, 1 Oct 2019 12:17:19 -0400
Message-ID: <20191001161721.13793-13-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-12-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
 <20191001161721.13793-10-mikita.lipski@amd.com>
 <20191001161721.13793-11-mikita.lipski@amd.com>
 <20191001161721.13793-12-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(428003)(189003)(199004)(76176011)(50226002)(51416003)(7696005)(16586007)(316002)(81166006)(81156014)(8676002)(36756003)(8936002)(26005)(54906003)(186003)(2876002)(4326008)(86362001)(2906002)(14444005)(356004)(6666004)(336012)(426003)(47776003)(48376002)(50466002)(70586007)(476003)(2351001)(1076003)(30864003)(486006)(11346002)(126002)(2616005)(446003)(450100002)(305945005)(5660300002)(6916009)(70206006)(478600001)(53416004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1143; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00942597-a2ae-48bc-6eb8-08d7468ae5dc
X-MS-TrafficTypeDiagnostic: CY4PR12MB1143:
X-Microsoft-Antispam-PRVS: <CY4PR12MB114301037D6E24C948510E08E49D0@CY4PR12MB1143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNK0Hd/tsSPJ85rwGQ9BMOoiLpDReA6EqSkD+wQKzfzvm0vFW7hRwrJtKe3rm+XVgXN5vAcxmN+7rM7yNaUJZ5+O1hbrKvGAGo5Y+6Po4nKfhRmqCobR8qAjULT8BNutvqpryYINgO4IR3GZaL/L61R/NOavYvtUYWENeMmF+3YZx/nmCxpfxZvATrtwJYHuMYXkDen21SNwcj5HaJ9UIbFz82AckuZm9fD/AfeznUlE4YEV4nRTTRQT1DwNELDXrFulEh7YfryeNRq82giBbBqXBv0WxVNLs2Bx+0NHiMAPl9n52nJN/aAzAPoPWUenLMNEnoo43eZlCZokKNRbdsfK8KBdB2QZi2REskhqf6paFhnb3CCeLTnzxLuChaGpkq03yRJbwIabq/h06H1rNIm3/sGpSK9y38v30iBUzLE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:46.0165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00942597-a2ae-48bc-6eb8-08d7468ae5dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agOJCQWCcFpY+X91yX0TDqkWQaOPs1wmytUzsXC52TI=;
 b=3BL4qdD3PL6PclxhjHsVPHsiGtHZZ9+IPfzRsPW/5d/Pcj5sNLg5D287W4tbO2xr9M/hzmCh7XwbeXvH6q4z5wUIG849SezYYcZugjfIbeov4heDJFJr2jJ4XfzXy+JtULJL+RPB7k/l70H/1FKf/CKT+gw6KBW/+2qhJiIP6nk=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKSWYgdGhlcmUgaXMg
bGltaXRlZCBsaW5rIGJhbmR3aWR0aCBvbiBhIE1TVCBuZXR3b3JrLAppdCBtdXN0IGJlIGRpdmlk
ZWQgZmFpcmx5IGJldHdlZW4gdGhlIHN0cmVhbXMgb24gdGhhdCBuZXR3b3JrCgpJbXBsZW1lbnQg
YW4gYWxnb3JpdGhtIHRvIGRldGVybWluZSB0aGUgY29ycmVjdCBEU0MgY29uZmlnCmZvciBlYWNo
IHN0cmVhbQoKVGhlIGFsZ29yaXRobToKVGhpcwogICAgIFsgICAgICAgICAgICAgICAgICAgXSAg
ICAgICAgICAoICkKcmVwcmVzZW50cyB0aGUgcmFuZ2Ugb2YgYmFuZHdpZHRocyBwb3NzaWJsZSBm
b3IgYSBnaXZlbiBzdHJlYW0uClRoZSBbXSBhcmVhIHJlcHJlc2VudHMgdGhlIHJhbmdlIG9mIERT
QyBjb25maWdzLCBhbmQgdGhlICgpCnJlcHJlc2VudHMgbm8gRFNDLiBUaGUgYmFuZHdpZHRoIHVz
ZWQgaW5jcmVhc2VzIGZyb20gbGVmdCB0byByaWdodC4KCkZpcnN0LCB0cnkgZGlzYWJsaW5nIERT
QyBvbiBhbGwgc3RyZWFtcwogICAgIFsgICAgICAgICAgICAgICAgICBdICAgICAgICAgICh8KQog
ICAgIFsgICAgICAgICAgICAgICAgICAgICBdICAgICAgICAgICAgKHwpCkNoZWNrIHRoaXMgYWdh
aW5zdCB0aGUgYmFuZHdpZHRoIGxpbWl0cyBvZiB0aGUgbGluayBhbmQgZWFjaCBicmFuY2gKKGlu
Y2x1ZGluZyBlYWNoIGVuZHBvaW50KS4gSWYgaXQgcGFzc2VzLCB0aGUgam9iIGlzIGRvbmUKClNl
Y29uZCwgdHJ5IG1heGltdW0gRFNDIGNvbXByZXNzaW9uIG9uIGFsbCBzdHJlYW1zCnRoYXQgc3Vw
cG9ydCBEU0MKICAgICBbfCAgICAgICAgIF0gICAgICAgICggKQogICAgIFt8ICAgICAgICAgICAg
ICAgIF0gICAgICAgICAoICkKSWYgdGhpcyBkb2VzIG5vdCBwYXNzLCB0aGVuIGVuYWJsaW5nIHRo
aXMgY29tYmluYXRpb24gb2Ygc3RyZWFtcwppcyBpbXBvc3NpYmxlCgpPdGhlcndpc2UsIGRpdmlk
ZSB0aGUgcmVtYWluaW5nIGJhbmR3aWR0aCBldmVubHkgYW1vbmdzdCB0aGUgc3RyZWFtcwogICAg
IFsgICAgICAgIHwgIF0gICAgICAgICAoICkKICAgICBbICAgICAgICB8ICAgICAgXSAgICAgICAg
KCApCgpJZiBvbmUgb3IgbW9yZSBvZiB0aGUgc3RyZWFtcyByZWFjaCBtaW5pbXVtIGNvbXByZXNz
aW9uLCBldmVubHkKZGl2aWRlIHRoZSByZWFtaW5pbmcgYmFuZHdpZHRoIGFtb25nc3QgdGhlIHJl
bWFpbmluZyBzdHJlYW1zCiAgICAgWyAgICB8XSAoICkKICAgICBbICAgICAgIHxdICAgKCApCiAg
ICAgWyAgICAgICAgICAgICAgICAgfCAgIF0gICAgICAgICAgICAgICAoICkKICAgICBbICAgICAg
ICAgICAgICAgICB8ICAgICAgXSAgICAgICAgICAgICAgICAgICggKQoKSWYgYWxsIHN0cmVhbXMg
Y2FuIHJlYWNoIG1pbmltdW0gY29tcHJlc3Npb24sIGRpc2FibGUgY29tcHJlc3Npb24KZ3JlZWRp
bHkKICAgICBbICAgICAgfF0gICggKQogICAgIFsgICAgICAgIHxdICAgICggKQogICAgIFsgICAg
ICAgICAgICAgICAgIF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh8KQoKUGVyZm9y
bSB0aGlzIGFsZ29yaXRobSBvbiBlYWNoIGZ1bGwgdXBkYXRlLCBvbiBlYWNoIE1TVCBsaW5rCndp
dGggYXQgbGVhc3Qgb25lIERTQyBzdHJlYW0gb24gaXQKCkFmdGVyIHRoZSBjb25maWdzIGFyZSBj
b21wdXRlZCwgY2FsbApkY24yMF9hZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJjZSBvbiBlYWNoIHN0
cmVhbSB3aXRoIERTQyBlbmFibGVkLgpJdCBpcyBvbmx5IGFmdGVyIGFsbCBzdHJlYW1zIGFyZSBj
cmVhdGVkIHRoYXQgd2UgY2FuIGtub3cgd2hpY2gKb2YgdGhlbSB3aWxsIG5lZWQgRFNDLgoKRG8g
YWxsIG9mIHRoaXMgYXQgdGhlIGVuZCBvZiBhbWRncHUgYXRvbWljIGNoZWNrLiAgSWYgaXQgZmFp
bHMsCmZhaWwgY2hlY2s7IFRoaXMgY29tYmluYXRpb24gb2YgdGltaW5ncyBjYW5ub3QgYmUgc3Vw
cG9ydGVkLgoKUmV2aWV3ZWQtYnk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQog
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgICA0ICsKIC4u
Li9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDM4NiArKysrKysr
KysrKysrKysrKysKIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmgg
ICB8ICAgNCArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMg
fCAgIDcgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaCB8
ICAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDQwMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCmluZGV4IDU5MTE0YjUyMDkwZC4uODFlMzA5MThmOWVjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTc3MDIsNiArNzcw
MiwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAkJaWYgKHJldCkKIAkJCWdvdG8gZmFpbDsKIAorI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCisJCWlmICghY29tcHV0ZV9tc3RfZHNjX2NvbmZpZ3NfZm9yX3N0
YXRlKGRtX3N0YXRlLT5jb250ZXh0KSkKKwkJCWdvdG8gZmFpbDsKKyNlbmRpZgogCQlpZiAoZGNf
dmFsaWRhdGVfZ2xvYmFsX3N0YXRlKGRjLCBkbV9zdGF0ZS0+Y29udGV4dCwgZmFsc2UpICE9IERD
X09LKSB7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYwppbmRleCAyNzBkOTcyYzljM2MuLjZiOTY5Njg4OTY2OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMKQEAgLTM4LDYgKzM4LDggQEAKIAogI2luY2x1ZGUgImkyY2F1eF9pbnRlcmZhY2UuaCIK
IAorI2luY2x1ZGUgImRjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgiCisKIC8qICNkZWZpbmUgVFJB
Q0VfRFBDRCAqLwogCiAjaWZkZWYgVFJBQ0VfRFBDRApAQCAtNDkwLDMgKzQ5MiwzODcgQEAgdm9p
ZCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcF9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5
X21hbmFnZXIgKmRtLAogCQlhY29ubmVjdG9yLT5jb25uZWN0b3JfaWQpOwogfQogCisjaWZkZWYg
Q09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKK3N0cnVjdCBkc2NfbXN0X2ZhaXJuZXNzX3Bh
cmFtcyB7CisJc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmc7CisJc3RydWN0IGRjX3Npbmsg
KnNpbms7CisJc3RydWN0IGRjX2RzY19id19yYW5nZSBid19yYW5nZTsKKwlib29sIGNvbXByZXNz
aW9uX3Bvc3NpYmxlOworCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7Cit9OworCitzdHJ1
Y3QgZHNjX21zdF9mYWlybmVzc192YXJzIHsKKwlpbnQgcGJuOworCWJvb2wgZHNjX2VuYWJsZWQ7
CisJaW50IGJwcF94MTY7Cit9OworCitzdGF0aWMgYm9vbCBwb3J0X2Rvd25zdHJlYW1fb2ZfYnJh
bmNoKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsCisJCXN0cnVjdCBkcm1fZHBfbXN0X2Jy
YW5jaCAqYnJhbmNoKQoreworCXdoaWxlIChwb3J0LT5wYXJlbnQpIHsKKwkJaWYgKHBvcnQtPnBh
cmVudCA9PSBicmFuY2gpCisJCQlyZXR1cm4gdHJ1ZTsKKworCQlpZiAocG9ydC0+cGFyZW50LT5w
b3J0X3BhcmVudCkKKwkJCXBvcnQgPSBwb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50OworCQllbHNl
CisJCQlicmVhazsKKwl9CisJcmV0dXJuIGZhbHNlOworfQorCitzdGF0aWMgYm9vbCBjaGVja19w
Ym5fbGltaXRfb25fYnJhbmNoKHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNoLAorCQlz
dHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3Rf
ZmFpcm5lc3NfdmFycyAqdmFycywgaW50IGNvdW50KQoreworCXN0cnVjdCBkcm1fZHBfbXN0X3Bv
cnQgKnBvcnQ7CisJaW50IGk7CisJaW50IHBibl9saW1pdCA9IDA7CisJaW50IHBibl91c2VkID0g
MDsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocG9ydCwgJmJyYW5jaC0+cG9ydHMsIG5leHQpIHsK
KwkJaWYgKHBvcnQtPm1zdGIpCisJCQlpZiAoIWNoZWNrX3Bibl9saW1pdF9vbl9icmFuY2gocG9y
dC0+bXN0YiwgcGFyYW1zLCB2YXJzLCBjb3VudCkpCisJCQkJcmV0dXJuIGZhbHNlOworCisJCWlm
IChwb3J0LT5hdmFpbGFibGVfcGJuID4gMCkKKwkJCXBibl9saW1pdCA9IHBvcnQtPmF2YWlsYWJs
ZV9wYm47CisJfQorCisJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKKwkJaWYgKHBvcnRf
ZG93bnN0cmVhbV9vZl9icmFuY2gocGFyYW1zW2ldLnBvcnQsIGJyYW5jaCkpCisJCQlwYm5fdXNl
ZCArPSB2YXJzW2ldLnBibjsKKwl9CisKKwlpZiAocGJuX3VzZWQgPiBwYm5fbGltaXQpCisJCXJl
dHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgYm9vbCBjaGVja19iYW5k
d2lkdGhfbGltaXRzKHN0cnVjdCBkY19saW5rICpkY19saW5rLAorCQlzdHJ1Y3QgZHNjX21zdF9m
YWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFycyAq
dmFycywKKwkJaW50IGNvdW50KQoreworCWludCBsaW5rX3RpbWVzbG90X2xpbWl0ID0gNjM7CisJ
aW50IGxpbmtfdGltZXNsb3RzX3VzZWQgPSAwOworCWludCBwYm5fcGVyX3RpbWVzbG90OworCWlu
dCBpOworCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbXN0X21ncjsKKworCS8qIGti
aXRzIHRvIHBibiwgZGl2aWRpbmcgYnkgNjQgKi8KKwlwYm5fcGVyX3RpbWVzbG90ID0gZGNfbGlu
a19iYW5kd2lkdGhfa2JwcyhkY19saW5rLAorCQkJZGNfbGlua19nZXRfbGlua19jYXAoZGNfbGlu
aykpIC8gKDggKiAxMDAwICogNTQpOworCisJLyogQ2hlY2sgbGluayBiYW5kd2lkdGggbGltaXQg
Ki8KKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKKwkJbGlua190aW1lc2xvdHNfdXNlZCAr
PSBESVZfUk9VTkRfVVAodmFyc1tpXS5wYm4sIHBibl9wZXJfdGltZXNsb3QpOworCisJaWYgKGxp
bmtfdGltZXNsb3RzX3VzZWQgPiBsaW5rX3RpbWVzbG90X2xpbWl0KQorCQlyZXR1cm4gZmFsc2U7
CisKKwkvKiBDaGVjayBicmFuY2ggYmFuZHdpZHRoIGxpbWl0IGZvciBlYWNoIHBvcnQgb24gZWFj
aCBicmFuY2ggKi8KKwltc3RfbWdyID0gcGFyYW1zWzBdLnBvcnQtPm1ncjsKKwlpZiAoIWNoZWNr
X3Bibl9saW1pdF9vbl9icmFuY2gobXN0X21nci0+bXN0X3ByaW1hcnksIHBhcmFtcywgdmFycywg
Y291bnQpKQorCQlyZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIGlu
dCBrYnBzX3RvX3BlYWtfcGJuKGludCBrYnBzKQoreworCXU2NCBwZWFrX2ticHMgPSBrYnBzOwor
CisJcGVha19rYnBzICo9IDEwMDY7CisJcGVha19rYnBzIC89IDEwMDA7CisJcmV0dXJuIChpbnQp
IERJVl9ST1VORF9VUChwZWFrX2ticHMgKiA2NCwgKDU0ICogOCAqIDEwMDApKTsKK30KKworc3Rh
dGljIHZvaWQgc2V0X2RzY19jb25maWdzX2Zyb21fZmFpcm5lc3NfdmFycyhzdHJ1Y3QgZHNjX21z
dF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFy
cyAqdmFycywKKwkJaW50IGNvdW50KQoreworCWludCBpOworCisJZm9yIChpID0gMDsgaSA8IGNv
dW50OyBpKyspIHsKKwkJbWVtc2V0KCZwYXJhbXNbaV0udGltaW5nLT5kc2NfY2ZnLCAwLCBzaXpl
b2YocGFyYW1zW2ldLnRpbWluZy0+ZHNjX2NmZykpOworCQlpZiAodmFyc1tpXS5kc2NfZW5hYmxl
ZCAmJiBkY19kc2NfY29tcHV0ZV9jb25maWcoCisJCQkJCXBhcmFtc1tpXS5zaW5rLT5jdHgtPmRj
LT5yZXNfcG9vbC0+ZHNjc1swXSwKKwkJCQkJJnBhcmFtc1tpXS5zaW5rLT5zaW5rX2RzY19jYXBz
LmRzY19kZWNfY2FwcywKKwkJCQkJcGFyYW1zW2ldLnNpbmstPmN0eC0+ZGMtPmRlYnVnLmRzY19t
aW5fc2xpY2VfaGVpZ2h0X292ZXJyaWRlLAorCQkJCQkwLAorCQkJCQlwYXJhbXNbaV0udGltaW5n
LAorCQkJCQkmcGFyYW1zW2ldLnRpbWluZy0+ZHNjX2NmZykpIHsKKwkJCXBhcmFtc1tpXS50aW1p
bmctPmZsYWdzLkRTQyA9IDE7CisJCQlwYXJhbXNbaV0udGltaW5nLT5kc2NfY2ZnLmJpdHNfcGVy
X3BpeGVsID0gdmFyc1tpXS5icHBfeDE2OworCQl9IGVsc2UgeworCQkJcGFyYW1zW2ldLnRpbWlu
Zy0+ZmxhZ3MuRFNDID0gMDsKKwkJfQorCisJfQorCit9CisKK3N0YXRpYyBpbnQgYnBwX3gxNl9m
cm9tX3BibihzdHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJhbXMgcGFyYW0sIGludCBwYm4pCit7
CisJc3RydWN0IGRjX2RzY19jb25maWcgZHNjX2NvbmZpZzsKKwl1NjQga2JwczsKKworCWticHMg
PSAodTY0KXBibiAqIDk5NCAqIDggKiA1NCAvIDY0OworCWRjX2RzY19jb21wdXRlX2NvbmZpZygK
KwkJCXBhcmFtLnNpbmstPmN0eC0+ZGMtPnJlc19wb29sLT5kc2NzWzBdLAorCQkJJnBhcmFtLnNp
bmstPnNpbmtfZHNjX2NhcHMuZHNjX2RlY19jYXBzLAorCQkJcGFyYW0uc2luay0+Y3R4LT5kYy0+
ZGVidWcuZHNjX21pbl9zbGljZV9oZWlnaHRfb3ZlcnJpZGUsCisJCQkoaW50KSBrYnBzLCBwYXJh
bS50aW1pbmcsICZkc2NfY29uZmlnKTsKKworCXJldHVybiBkc2NfY29uZmlnLmJpdHNfcGVyX3Bp
eGVsOworfQorCitzdGF0aWMgdm9pZCBpbmNyZWFzZV9kc2NfYnBwKHN0cnVjdCBkY19saW5rICpk
Y19saW5rLAorCQlzdHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3Ry
dWN0IGRzY19tc3RfZmFpcm5lc3NfdmFycyAqdmFycywKKwkJaW50IGNvdW50KQoreworCWludCBp
OworCWJvb2wgYnBwX2luY3JlYXNlZFtNQVhfUElQRVNdOworCWludCBpbml0aWFsX3NsYWNrW01B
WF9QSVBFU107CisJaW50IG1pbl9pbml0aWFsX3NsYWNrOworCWludCBuZXh0X2luZGV4OworCWlu
dCByZW1haW5pbmdfdG9faW5jcmVhc2UgPSAwOworCWludCBwYm5fcGVyX3RpbWVzbG90OworCWlu
dCBsaW5rX3RpbWVzbG90c191c2VkOworCWludCBmYWlyX3Bibl9hbGxvYzsKKworCWZvciAoaSA9
IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCWlmICh2YXJzW2ldLmRzY19lbmFibGVkKSB7CisJCQlp
bml0aWFsX3NsYWNrW2ldID0ga2Jwc190b19wZWFrX3BibihwYXJhbXNbaV0uYndfcmFuZ2UubWF4
X2ticHMpIC0gdmFyc1tpXS5wYm47CisJCQlicHBfaW5jcmVhc2VkW2ldID0gZmFsc2U7CisJCQly
ZW1haW5pbmdfdG9faW5jcmVhc2UgKz0gMTsKKwkJfSBlbHNlIHsKKwkJCWluaXRpYWxfc2xhY2tb
aV0gPSAwOworCQkJYnBwX2luY3JlYXNlZFtpXSA9IHRydWU7CisJCX0KKwl9CisKKwlwYm5fcGVy
X3RpbWVzbG90ID0gZGNfbGlua19iYW5kd2lkdGhfa2JwcyhkY19saW5rLAorCQkJZGNfbGlua19n
ZXRfbGlua19jYXAoZGNfbGluaykpIC8gKDggKiAxMDAwICogNTQpOworCisJd2hpbGUgKHJlbWFp
bmluZ190b19pbmNyZWFzZSkgeworCQluZXh0X2luZGV4ID0gLTE7CisJCW1pbl9pbml0aWFsX3Ns
YWNrID0gLTE7CisJCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCQlpZiAoIWJwcF9p
bmNyZWFzZWRbaV0pIHsKKwkJCQlpZiAobWluX2luaXRpYWxfc2xhY2sgPT0gLTEgfHwgbWluX2lu
aXRpYWxfc2xhY2sgPiBpbml0aWFsX3NsYWNrW2ldKSB7CisJCQkJCW1pbl9pbml0aWFsX3NsYWNr
ID0gaW5pdGlhbF9zbGFja1tpXTsKKwkJCQkJbmV4dF9pbmRleCA9IGk7CisJCQkJfQorCQkJfQor
CQl9CisKKwkJaWYgKG5leHRfaW5kZXggPT0gLTEpCisJCQlicmVhazsKKworCQlsaW5rX3RpbWVz
bG90c191c2VkID0gMDsKKworCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKKwkJCWxpbmtf
dGltZXNsb3RzX3VzZWQgKz0gRElWX1JPVU5EX1VQKHZhcnNbaV0ucGJuLCBwYm5fcGVyX3RpbWVz
bG90KTsKKworCQlmYWlyX3Bibl9hbGxvYyA9ICg2MyAtIGxpbmtfdGltZXNsb3RzX3VzZWQpIC8g
cmVtYWluaW5nX3RvX2luY3JlYXNlICogcGJuX3Blcl90aW1lc2xvdDsKKworCQlpZiAoaW5pdGlh
bF9zbGFja1tuZXh0X2luZGV4XSA+IGZhaXJfcGJuX2FsbG9jKSB7CisJCQl2YXJzW25leHRfaW5k
ZXhdLnBibiArPSBmYWlyX3Bibl9hbGxvYzsKKwkJCWlmIChjaGVja19iYW5kd2lkdGhfbGltaXRz
KGRjX2xpbmssIHBhcmFtcywgdmFycywgY291bnQpKQorCQkJCXZhcnNbbmV4dF9pbmRleF0uYnBw
X3gxNiA9IGJwcF94MTZfZnJvbV9wYm4ocGFyYW1zW25leHRfaW5kZXhdLCB2YXJzW25leHRfaW5k
ZXhdLnBibik7CisJCQllbHNlCisJCQkJdmFyc1tuZXh0X2luZGV4XS5wYm4gLT0gZmFpcl9wYm5f
YWxsb2M7CisJCX0gZWxzZSB7CisJCQl2YXJzW25leHRfaW5kZXhdLnBibiArPSBpbml0aWFsX3Ns
YWNrW25leHRfaW5kZXhdOworCQkJaWYgKGNoZWNrX2JhbmR3aWR0aF9saW1pdHMoZGNfbGluaywg
cGFyYW1zLCB2YXJzLCBjb3VudCkpCisJCQkJdmFyc1tuZXh0X2luZGV4XS5icHBfeDE2ID0gcGFy
YW1zW25leHRfaW5kZXhdLmJ3X3JhbmdlLm1heF90YXJnZXRfYnBwX3gxNjsKKwkJCWVsc2UKKwkJ
CQl2YXJzW25leHRfaW5kZXhdLnBibiAtPSBpbml0aWFsX3NsYWNrW25leHRfaW5kZXhdOworCQl9
CisKKwkJYnBwX2luY3JlYXNlZFtuZXh0X2luZGV4XSA9IHRydWU7CisJCXJlbWFpbmluZ190b19p
bmNyZWFzZS0tOworCX0KK30KKworc3RhdGljIHZvaWQgdHJ5X2Rpc2FibGVfZHNjKHN0cnVjdCBk
Y19saW5rICpkY19saW5rLAorCQlzdHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJhbXMgKnBhcmFt
cywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFycyAqdmFycywKKwkJaW50IGNvdW50KQor
eworCWludCBpOworCWJvb2wgdHJpZWRbTUFYX1BJUEVTXTsKKwlpbnQga2Jwc19pbmNyZWFzZVtN
QVhfUElQRVNdOworCWludCBtYXhfa2Jwc19pbmNyZWFzZTsKKwlpbnQgbmV4dF9pbmRleDsKKwlp
bnQgcmVtYWluaW5nX3RvX3RyeSA9IDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykg
eworCQlpZiAodmFyc1tpXS5kc2NfZW5hYmxlZCAmJiB2YXJzW2ldLmJwcF94MTYgPT0gcGFyYW1z
W2ldLmJ3X3JhbmdlLm1heF90YXJnZXRfYnBwX3gxNikgeworCQkJa2Jwc19pbmNyZWFzZVtpXSA9
IHBhcmFtc1tpXS5id19yYW5nZS5zdHJlYW1fa2JwcyAtIHBhcmFtc1tpXS5id19yYW5nZS5tYXhf
a2JwczsKKwkJCXRyaWVkW2ldID0gZmFsc2U7CisJCQlyZW1haW5pbmdfdG9fdHJ5ICs9IDE7CisJ
CX0gZWxzZSB7CisJCQlrYnBzX2luY3JlYXNlW2ldID0gMDsKKwkJCXRyaWVkW2ldID0gdHJ1ZTsK
KwkJfQorCX0KKworCXdoaWxlIChyZW1haW5pbmdfdG9fdHJ5KSB7CisJCW5leHRfaW5kZXggPSAt
MTsKKwkJbWF4X2ticHNfaW5jcmVhc2UgPSAtMTsKKwkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBp
KyspIHsKKwkJCWlmICghdHJpZWRbaV0pIHsKKwkJCQlpZiAobWF4X2ticHNfaW5jcmVhc2UgPT0g
LTEgfHwgbWF4X2ticHNfaW5jcmVhc2UgPCBrYnBzX2luY3JlYXNlW2ldKSB7CisJCQkJCW1heF9r
YnBzX2luY3JlYXNlID0ga2Jwc19pbmNyZWFzZVtpXTsKKwkJCQkJbmV4dF9pbmRleCA9IGk7CisJ
CQkJfQorCQkJfQorCQl9CisKKwkJaWYgKG5leHRfaW5kZXggPT0gLTEpCisJCQlicmVhazsKKwor
CQl2YXJzW25leHRfaW5kZXhdLnBibiA9IGticHNfdG9fcGVha19wYm4ocGFyYW1zW25leHRfaW5k
ZXhdLmJ3X3JhbmdlLnN0cmVhbV9rYnBzKTsKKworCQlpZiAoY2hlY2tfYmFuZHdpZHRoX2xpbWl0
cyhkY19saW5rLCBwYXJhbXMsIHZhcnMsIGNvdW50KSkgeworCQkJdmFyc1tuZXh0X2luZGV4XS5k
c2NfZW5hYmxlZCA9IGZhbHNlOworCQkJdmFyc1tuZXh0X2luZGV4XS5icHBfeDE2ID0gMDsKKwkJ
fSBlbHNlIHsKKwkJCXZhcnNbbmV4dF9pbmRleF0ucGJuID0ga2Jwc190b19wZWFrX3BibihwYXJh
bXNbbmV4dF9pbmRleF0uYndfcmFuZ2UubWF4X2ticHMpOworCQl9CisKKwkJdHJpZWRbbmV4dF9p
bmRleF0gPSB0cnVlOworCQlyZW1haW5pbmdfdG9fdHJ5LS07CisJfQorfQorCitzdGF0aWMgYm9v
bCBjb21wdXRlX21zdF9kc2NfY29uZmlnc19mb3JfbGluayhzdHJ1Y3QgZGNfc3RhdGUgKmRjX3N0
YXRlLCBzdHJ1Y3QgZGNfbGluayAqZGNfbGluaykKK3sKKwlpbnQgaTsKKwlzdHJ1Y3QgZGNfc3Ry
ZWFtX3N0YXRlICpzdHJlYW07CisJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfcGFyYW1zIHBhcmFt
c1tNQVhfUElQRVNdOworCXN0cnVjdCBkc2NfbXN0X2ZhaXJuZXNzX3ZhcnMgdmFyc1tNQVhfUElQ
RVNdOworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCWludCBjb3Vu
dCA9IDA7CisKKwltZW1zZXQocGFyYW1zLCAwLCBzaXplb2YocGFyYW1zKSk7CisKKwkvKiBTZXQg
dXAgcGFyYW1zICovCisJZm9yIChpID0gMDsgaSA8IGRjX3N0YXRlLT5zdHJlYW1fY291bnQ7IGkr
KykgeworCQlzdHJlYW0gPSBkY19zdGF0ZS0+c3RyZWFtc1tpXTsKKworCQlpZiAoc3RyZWFtLT5s
aW5rICE9IGRjX2xpbmspCisJCQljb250aW51ZTsKKworCQlzdHJlYW0tPnRpbWluZy5mbGFncy5E
U0MgPSAwOworCisJCXBhcmFtc1tjb3VudF0udGltaW5nID0gJnN0cmVhbS0+dGltaW5nOworCQlw
YXJhbXNbY291bnRdLnNpbmsgPSBzdHJlYW0tPnNpbms7CisJCWFjb25uZWN0b3IgPSAoc3RydWN0
IGFtZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OworCQlwYXJh
bXNbY291bnRdLnBvcnQgPSBhY29ubmVjdG9yLT5wb3J0OworCQlwYXJhbXNbY291bnRdLmNvbXBy
ZXNzaW9uX3Bvc3NpYmxlID0gc3RyZWFtLT5zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2Fw
cy5pc19kc2Nfc3VwcG9ydGVkOworCQlpZiAoIWRjX2RzY19jb21wdXRlX2JhbmR3aWR0aF9yYW5n
ZSgKKwkJCQlzdHJlYW0tPnNpbmstPmN0eC0+ZGMtPnJlc19wb29sLT5kc2NzWzBdLAorCQkJCXN0
cmVhbS0+c2luay0+Y3R4LT5kYy0+ZGVidWcuZHNjX21pbl9zbGljZV9oZWlnaHRfb3ZlcnJpZGUs
CisJCQkJOCwgMTYsCisJCQkJJnN0cmVhbS0+c2luay0+c2lua19kc2NfY2Fwcy5kc2NfZGVjX2Nh
cHMsCisJCQkJJnN0cmVhbS0+dGltaW5nLCAmcGFyYW1zW2NvdW50XS5id19yYW5nZSkpCisJCQlw
YXJhbXNbY291bnRdLmJ3X3JhbmdlLnN0cmVhbV9rYnBzID0gZGNfYmFuZHdpZHRoX2luX2ticHNf
ZnJvbV90aW1pbmcoJnN0cmVhbS0+dGltaW5nKTsKKworCQljb3VudCsrOworCX0KKworCS8qIFRy
eSBubyBjb21wcmVzc2lvbiAqLworCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCXZh
cnNbaV0ucGJuID0ga2Jwc190b19wZWFrX3BibihwYXJhbXNbaV0uYndfcmFuZ2Uuc3RyZWFtX2ti
cHMpOworCQl2YXJzW2ldLmRzY19lbmFibGVkID0gZmFsc2U7CisJCXZhcnNbaV0uYnBwX3gxNiA9
IDA7CisJfQorCisJaWYgKGNoZWNrX2JhbmR3aWR0aF9saW1pdHMoZGNfbGluaywgcGFyYW1zLCB2
YXJzLCBjb3VudCkpIHsKKwkJc2V0X2RzY19jb25maWdzX2Zyb21fZmFpcm5lc3NfdmFycyhwYXJh
bXMsIHZhcnMsIGNvdW50KTsKKwkJcmV0dXJuIHRydWU7CisJfQorCisJLyogVHJ5IG1heCBjb21w
cmVzc2lvbiAqLworCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCWlmIChwYXJhbXNb
aV0uY29tcHJlc3Npb25fcG9zc2libGUpIHsKKwkJCXZhcnNbaV0ucGJuID0ga2Jwc190b19wZWFr
X3BibihwYXJhbXNbaV0uYndfcmFuZ2UubWluX2ticHMpOworCQkJdmFyc1tpXS5kc2NfZW5hYmxl
ZCA9IHRydWU7CisJCQl2YXJzW2ldLmJwcF94MTYgPSBwYXJhbXNbaV0uYndfcmFuZ2UubWluX3Rh
cmdldF9icHBfeDE2OworCQl9IGVsc2UgeworCQkJdmFyc1tpXS5wYm4gPSBrYnBzX3RvX3BlYWtf
cGJuKHBhcmFtc1tpXS5id19yYW5nZS5zdHJlYW1fa2Jwcyk7CisJCQl2YXJzW2ldLmRzY19lbmFi
bGVkID0gZmFsc2U7CisJCQl2YXJzW2ldLmJwcF94MTYgPSAwOworCQl9CisJfQorCisJaWYgKCFj
aGVja19iYW5kd2lkdGhfbGltaXRzKGRjX2xpbmssIHBhcmFtcywgdmFycywgY291bnQpKQorCQly
ZXR1cm4gZmFsc2U7CisKKwkvKiBPcHRpbWl6ZSBkZWdyZWUgb2YgY29tcHJlc3Npb24gKi8KKwlp
bmNyZWFzZV9kc2NfYnBwKGRjX2xpbmssIHBhcmFtcywgdmFycywgY291bnQpOworCisJdHJ5X2Rp
c2FibGVfZHNjKGRjX2xpbmssIHBhcmFtcywgdmFycywgY291bnQpOworCisJc2V0X2RzY19jb25m
aWdzX2Zyb21fZmFpcm5lc3NfdmFycyhwYXJhbXMsIHZhcnMsIGNvdW50KTsKKworCXJldHVybiB0
cnVlOworfQorCitib29sIGNvbXB1dGVfbXN0X2RzY19jb25maWdzX2Zvcl9zdGF0ZShzdHJ1Y3Qg
ZGNfc3RhdGUgKmRjX3N0YXRlKQoreworCWludCBpLCBqOworCXN0cnVjdCBkY19zdHJlYW1fc3Rh
dGUgKnN0cmVhbTsKKwlib29sIGNvbXB1dGVkX3N0cmVhbXNbTUFYX1BJUEVTXTsKKwlzdHJ1Y3Qg
YW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsKKworCWZvciAoaSA9IDA7IGkgPCBkY19z
dGF0ZS0+c3RyZWFtX2NvdW50OyBpKyspCisJCWNvbXB1dGVkX3N0cmVhbXNbaV0gPSBmYWxzZTsK
KworCWZvciAoaSA9IDA7IGkgPCBkY19zdGF0ZS0+c3RyZWFtX2NvdW50OyBpKyspIHsKKwkJc3Ry
ZWFtID0gZGNfc3RhdGUtPnN0cmVhbXNbaV07CisKKwkJaWYgKHN0cmVhbS0+c2lnbmFsICE9IFNJ
R05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QpCisJCQljb250aW51ZTsKKworCQlhY29ubmVjdG9y
ID0gKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4
dDsKKworCQlpZiAoIWFjb25uZWN0b3IgfHwgIWFjb25uZWN0b3ItPmRjX3NpbmspCisJCQljb250
aW51ZTsKKworCQlpZiAoIWFjb25uZWN0b3ItPmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNjX2Rl
Y19jYXBzLmlzX2RzY19zdXBwb3J0ZWQpCisJCQljb250aW51ZTsKKworCQlpZiAoY29tcHV0ZWRf
c3RyZWFtc1tpXSkKKwkJCWNvbnRpbnVlOworCisJCW11dGV4X2xvY2soJmFjb25uZWN0b3ItPm1z
dF9tZ3IubG9jayk7CisJCWlmICghY29tcHV0ZV9tc3RfZHNjX2NvbmZpZ3NfZm9yX2xpbmsoZGNf
c3RhdGUsIHN0cmVhbS0+bGluaykpIHsKKwkJCW11dGV4X3VubG9jaygmYWNvbm5lY3Rvci0+bXN0
X21nci5sb2NrKTsKKwkJCXJldHVybiBmYWxzZTsKKwkJfQorCQltdXRleF91bmxvY2soJmFjb25u
ZWN0b3ItPm1zdF9tZ3IubG9jayk7CisKKwkJZm9yIChqID0gMDsgaiA8IGRjX3N0YXRlLT5zdHJl
YW1fY291bnQ7IGorKykgeworCQkJaWYgKGRjX3N0YXRlLT5zdHJlYW1zW2pdLT5saW5rID09IHN0
cmVhbS0+bGluaykKKwkJCQljb21wdXRlZF9zdHJlYW1zW2pdID0gdHJ1ZTsKKwkJfQorCX0KKwor
CWZvciAoaSA9IDA7IGkgPCBkY19zdGF0ZS0+c3RyZWFtX2NvdW50OyBpKyspIHsKKwkJc3RyZWFt
ID0gZGNfc3RhdGUtPnN0cmVhbXNbaV07CisKKwkJaWYgKHN0cmVhbS0+dGltaW5nLmZsYWdzLkRT
QyA9PSAxKQorCQkJZGNuMjBfYWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2Uoc3RyZWFtLT5jdHgt
PmRjLCBkY19zdGF0ZSwgc3RyZWFtKTsKKwl9CisKKwlyZXR1cm4gdHJ1ZTsKK30KKyNlbmRpZgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuaAppbmRleCAyZGE4NTFiNDAwNDIuLmRhOTU3NjExMjE0YSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmgKQEAgLTMyLDQgKzMyLDggQEAgc3RydWN0IGFtZGdwdV9kbV9j
b25uZWN0b3I7CiB2b2lkIGFtZGdwdV9kbV9pbml0aWFsaXplX2RwX2Nvbm5lY3RvcihzdHJ1Y3Qg
YW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICphY29ubmVjdG9yKTsKIAorCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFND
X1NVUFBPUlQKK2Jvb2wgY29tcHV0ZV9tc3RfZHNjX2NvbmZpZ3NfZm9yX3N0YXRlKHN0cnVjdCBk
Y19zdGF0ZSAqZGNfc3RhdGUpOworI2VuZGlmCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggZjU3YzY4
NjM5OGZlLi45OGFkODAzZmYyMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0xNDQ3LDcgKzE0NDcsNyBAQCBz
dGF0aWMgdm9pZCByZWxlYXNlX2RzYyhzdHJ1Y3QgcmVzb3VyY2VfY29udGV4dCAqcmVzX2N0eCwK
IAogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKLXN0YXRpYyBlbnVtIGRj
X3N0YXR1cyBhZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJjZShzdHJ1Y3QgZGMgKmRjLAorZW51bSBk
Y19zdGF0dXMgZGNuMjBfYWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2Uoc3RydWN0IGRjICpkYywK
IAkJc3RydWN0IGRjX3N0YXRlICpkY19jdHgsCiAJCXN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKmRj
X3N0cmVhbSkKIHsKQEAgLTE0NjIsNiArMTQ2Miw5IEBAIHN0YXRpYyBlbnVtIGRjX3N0YXR1cyBh
ZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJjZShzdHJ1Y3QgZGMgKmRjLAogCQlpZiAocGlwZV9jdHgt
PnN0cmVhbSAhPSBkY19zdHJlYW0pCiAJCQljb250aW51ZTsKIAorCQlpZiAocGlwZV9jdHgtPnN0
cmVhbV9yZXMuZHNjKQorCQkJY29udGludWU7CisKIAkJYWNxdWlyZV9kc2MoJmRjX2N0eC0+cmVz
X2N0eCwgcG9vbCwgJnBpcGVfY3R4LT5zdHJlYW1fcmVzLmRzYyk7CiAKIAkJLyogVGhlIG51bWJl
ciBvZiBEU0NzIGNhbiBiZSBsZXNzIHRoYW4gdGhlIG51bWJlciBvZiBwaXBlcyAqLwpAQCAtMTUx
Myw3ICsxNTE2LDcgQEAgZW51bSBkY19zdGF0dXMgZGNuMjBfYWRkX3N0cmVhbV90b19jdHgoc3Ry
dWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpuZXdfY3R4LAogI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCiAJLyogR2V0IGEgRFNDIGlmIHJlcXVpcmVkIGFuZCBhdmFpbGFi
bGUgKi8KIAlpZiAocmVzdWx0ID09IERDX09LICYmIGRjX3N0cmVhbS0+dGltaW5nLmZsYWdzLkRT
QykKLQkJcmVzdWx0ID0gYWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2UoZGMsIG5ld19jdHgsIGRj
X3N0cmVhbSk7CisJCXJlc3VsdCA9IGRjbjIwX2FkZF9kc2NfdG9fc3RyZWFtX3Jlc291cmNlKGRj
LCBuZXdfY3R4LCBkY19zdHJlYW0pOwogI2VuZGlmCiAKIAlpZiAocmVzdWx0ID09IERDX09LKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuaAppbmRleCA0NGY5NWFhMGQ2MWUuLjIyMDllYmRhNmVmNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgKQEAg
LTEzMSw2ICsxMzEsNyBAQCB2b2lkIGRjbjIwX2NhbGN1bGF0ZV9kbGdfcGFyYW1zKAogCiBlbnVt
IGRjX3N0YXR1cyBkY24yMF9idWlsZF9tYXBwZWRfcmVzb3VyY2UoY29uc3Qgc3RydWN0IGRjICpk
Yywgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJl
YW0pOwogZW51bSBkY19zdGF0dXMgZGNuMjBfYWRkX3N0cmVhbV90b19jdHgoc3RydWN0IGRjICpk
Yywgc3RydWN0IGRjX3N0YXRlICpuZXdfY3R4LCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpkY19z
dHJlYW0pOworZW51bSBkY19zdGF0dXMgZGNuMjBfYWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2Uo
c3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpkY19jdHgsIHN0cnVjdCBkY19zdHJlYW1f
c3RhdGUgKmRjX3N0cmVhbSk7CiBlbnVtIGRjX3N0YXR1cyBkY24yMF9yZW1vdmVfc3RyZWFtX2Zy
b21fY3R4KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0eCwgc3RydWN0IGRj
X3N0cmVhbV9zdGF0ZSAqZGNfc3RyZWFtKTsKIGVudW0gZGNfc3RhdHVzIGRjbjIwX2dldF9kZWZh
dWx0X3N3aXp6bGVfbW9kZShzdHJ1Y3QgZGNfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKTsKIAot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
