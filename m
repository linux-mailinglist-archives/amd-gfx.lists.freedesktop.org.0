Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D4AF17A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC2F6E977;
	Tue, 10 Sep 2019 19:04:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13D16E95A
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg8oT5/BHtR3a1xydhgTwE7xAxVu1e7ijHLDxr1ZANdwH04fSqEATprX1ofRbFVtJJLXA3TfYYBSU1E0KZgYQreD/5vXXN335cINDWLw2wu75o4fnbVXEI7/ticK4f319bYdHJM0M2iByV65GlEnIlfZT5zlWpo3n+9Gjx8/Ad5xpw6G01nwTDIng3o28oo8Cw8aj7Ypg7ZvwA1fFnalBP/GbMpaaWLwUbhMrkuj5dfaxTSeV1FnGVQ9uhRNFB3g8aT4cELavH/XVkvg/dWEEUNjLn5TPOdg8VwiebMBBPvbgNdD313bWTD6EKmmPehojg7mGW/44QFVh2tQOgi+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb2nU1Evuj5enGDxBJmYIccfTIkhycf8TSC1gA6kPpU=;
 b=VpUwkWBxjA77s3J4Vf3FMDt2VOyIHjDUbh3nfx/GMcoFdYPiUXkZKjEIBVEWNnGnSu3Gt5zokD0+GIn8Wu7M9bNKKQ1vjETq2Py+ab+2ShtVqsbNFyrQyuuG33BzYierAPZBGnIAANC4mLVDqDHrFO8IpVz96TdxXlSYDYs/3IdOqNtJswcSHzNclbydGc6jz2CaEV9nIcVd7XCHf6f6zOlcbuy+vXPoYg+vIJDPM4RAkIOhs2SLiqm64VQJwX4JFziqBgCUvohsZpgSuz4turCw6Xd0PK8GTkHdfx4emrBYMn+AlLS/7UCyQW2TAXZ6VbB6B6XEMV67p3PJVAqJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by DM6PR12MB3707.namprd12.prod.outlook.com
 (2603:10b6:5:1c1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Tue, 10 Sep
 2019 19:04:40 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:40 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:35 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/20] drm/amd/display: Update CP property based on HW query
Date: Tue, 10 Sep 2019 15:04:20 -0400
Message-ID: <20190910190422.794-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(189003)(199004)(6916009)(70586007)(86362001)(53936002)(81166006)(15650500001)(305945005)(51416003)(8936002)(76176011)(48376002)(81156014)(7696005)(14444005)(50226002)(4326008)(478600001)(186003)(126002)(1076003)(336012)(16586007)(476003)(2616005)(26005)(486006)(6666004)(356004)(50466002)(8676002)(316002)(2351001)(2906002)(5660300002)(446003)(36756003)(70206006)(47776003)(53416004)(11346002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3707; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f82b08bb-d970-491d-2d6f-08d73621bb82
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3707; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3707:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3707F2ECD4F41EA1F34CA16FF9B60@DM6PR12MB3707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LKABNT0bf5GobiMSa/34BFB2KED6rBY7OfCHKcMtOyDwXC1wyX1o/2Mhq3KKTw9cpo0+xLac4AOKnu1K0LJ2/yNOIe/6RBa/YM870H7vKmzbijEDZ/iwaQkdiIOiHi0+0hRo7jT+zeAXLW6osXRtD63qjqh5cuzXsjCCjhBPcpu3VbSWXOoGrqnoWycIXp3p/4OTpxezhZLgJfHgPT9B/kdQj0YLzAB5ifsfPbuA++/kWI20S2sMoNRC+N1lY+iKceSgvkTjmQTVoS+9LwZLcW4j45zN9yaIdd5lur75UYEG3lwHlKnlYQf/59CdEgdE/LnAKswVLIFEjgA3ld/GEoZpGLT4CpYLbTeGrMAzAYXAUqyufVmRgTVhsXxmdu03R50fsrjHdUP+QsZfFfVtGCH+AUHZMd30tXqJYy8kr/g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:40.2915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f82b08bb-d970-491d-2d6f-08d73621bb82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb2nU1Evuj5enGDxBJmYIccfTIkhycf8TSC1gA6kPpU=;
 b=OXcaoceerV3j/j+U2iJzc8/bJo5J1hQ1fGyCED9047nL+5+Jobnd+yXNUrefCLGhkhRuqNavlgl6G4UHo0GE1mDGKFSlyLcn7350wAST8yvvXPL0Tufr/cuTPdCQcRnlog0cVfQtKPQ/dejX8R8UGp7iBgF00i2asElgwftbob8=
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

W1doeV0KV2UgbmVlZCB0byB1c2UgSFcgc3RhdGUgdG8gc2V0IGNvbnRlbnQgcHJvdGVjdGlvbiB0
byBFTkFCTEVELgpUaGlzIHdheSB3ZSBrbm93IHRoYXQgdGhlIGxpbmsgaXMgZW5jcnlwdGVkIGZy
b20gdGhlIEhXIHNpZGUKCltIb3ddCkNyZWF0ZSBhIHdvcmtxdWV1ZSB0aGF0IHF1ZXJpZXMgdGhl
IEhXIGV2ZXJ5IH4yc2Vjb25kcywgYW5kIHNldHMgaXQgdG8KRU5BQkxFRCBvciBERVNJUkVEIGJh
c2VkIG9uIHRoZSByZXN1bHQgZnJvbSB0aGUgaGFyZHdhcmUKClNpZ25lZC1vZmYtYnk6IEJoYXdh
bnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFy
cnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTYgKy0tLS0KIC4uLi9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyAgICB8IDY1ICsrKysrKysrKysrKysrKysrKy0K
IC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuaCAgICB8ICA3ICstCiAz
IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IGExODk1Yjg3M2VmMi4uODc5YjcwZjJjYjBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTUzODcsMTkgKzUzODcsOSBAQCBz
dGF0aWMgdm9pZCB1cGRhdGVfY29udGVudF9wcm90ZWN0aW9uKHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlICpzdGF0ZSwgY29uc3QgcwogewogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICph
Y29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwogCi0JaWYgKHN0
YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX0RF
U0lSRUQpIHsKLQkJaGRjcF9hZGRfZGlzcGxheShoZGNwX3csIGFjb25uZWN0b3ItPmRjX2xpbmst
PmxpbmtfaW5kZXgpOwotCi0JCS8qCi0JCSAqIFRPRE86IEVOQUJMRUQgc2hvdWxkIGJlIHZlcmlm
aWVkIHVzaW5nIHBzcCwgaXQgaXMgcGxhbm5lZCBsYXRlci4KLQkJICogSnVzdCBzZXQgdGhpcyB0
byBFTkFCTEVEIGZvciBub3cKLQkJICovCi0JCXN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPSBE
Uk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fRU5BQkxFRDsKLQotCQlyZXR1cm47Ci0JfQotCi0J
aWYgKHN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNU
SU9OX1VOREVTSVJFRCkKKwlpZiAoc3RhdGUtPmNvbnRlbnRfcHJvdGVjdGlvbiA9PSBEUk1fTU9E
RV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRCkKKwkJaGRjcF9hZGRfZGlzcGxheShoZGNwX3cs
IGFjb25uZWN0b3ItPmRjX2xpbmstPmxpbmtfaW5kZXgsIGFjb25uZWN0b3IpOworCWVsc2UgaWYg
KHN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9O
X1VOREVTSVJFRCkKIAkJaGRjcF9yZW1vdmVfZGlzcGxheShoZGNwX3csIGFjb25uZWN0b3ItPmRj
X2xpbmstPmxpbmtfaW5kZXgsIGFjb25uZWN0b3ItPmJhc2UuaW5kZXgpOwogCiB9CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMKaW5kZXggOWQxMWQ3Njk1NTA4Li4yNDQzYzIzOGMxODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKQEAgLTI3
LDYgKzI3LDcgQEAKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIK
ICNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCisjaW5jbHVkZSA8ZHJtL2RybV9oZGNwLmg+CiAKIGJv
b2wgbHBfd3JpdGVfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgYWRkcmVzcywgY29uc3QgdWlu
dDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkKIHsKQEAgLTgyLDE2ICs4MywxOSBAQCBzdGF0aWMg
dm9pZCBwcm9jZXNzX291dHB1dChzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3Bfd29yaykKIAog
fQogCi12b2lkIGhkY3BfYWRkX2Rpc3BsYXkoc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpoZGNwX3dv
cmssIHVuc2lnbmVkIGludCBsaW5rX2luZGV4KQordm9pZCBoZGNwX2FkZF9kaXNwbGF5KHN0cnVj
dCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrLCB1bnNpZ25lZCBpbnQgbGlua19pbmRleCwgc3Ry
dWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCiB7CiAJc3RydWN0IGhkY3Bfd29y
a3F1ZXVlICpoZGNwX3cgPSAmaGRjcF93b3JrW2xpbmtfaW5kZXhdOwogCXN0cnVjdCBtb2RfaGRj
cF9kaXNwbGF5ICpkaXNwbGF5ID0gJmhkY3Bfd29ya1tsaW5rX2luZGV4XS5kaXNwbGF5OwogCXN0
cnVjdCBtb2RfaGRjcF9saW5rICpsaW5rID0gJmhkY3Bfd29ya1tsaW5rX2luZGV4XS5saW5rOwog
CiAJbXV0ZXhfbG9jaygmaGRjcF93LT5tdXRleCk7CisJaGRjcF93LT5hY29ubmVjdG9yID0gYWNv
bm5lY3RvcjsKIAogCW1vZF9oZGNwX2FkZF9kaXNwbGF5KCZoZGNwX3ctPmhkY3AsIGxpbmssIGRp
c3BsYXksICZoZGNwX3ctPm91dHB1dCk7CiAKKwlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmhkY3Bf
dy0+cHJvcGVydHlfdmFsaWRhdGVfZHdvcmssIG1zZWNzX3RvX2ppZmZpZXMoRFJNX0hEQ1BfQ0hF
Q0tfUEVSSU9EX01TKSk7CisKIAlwcm9jZXNzX291dHB1dChoZGNwX3cpOwogCiAJbXV0ZXhfdW5s
b2NrKCZoZGNwX3ctPm11dGV4KTsKQEAgLTEwNiw2ICsxMTAsOSBAQCB2b2lkIGhkY3BfcmVtb3Zl
X2Rpc3BsYXkoc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpoZGNwX3dvcmssIHVuc2lnbmVkIGludCBs
aW5rX2luZAogCiAJbW9kX2hkY3BfcmVtb3ZlX2Rpc3BsYXkoJmhkY3Bfdy0+aGRjcCwgZGlzcGxh
eV9pbmRleCwgJmhkY3Bfdy0+b3V0cHV0KTsKIAorCWNhbmNlbF9kZWxheWVkX3dvcmsoJmhkY3Bf
dy0+cHJvcGVydHlfdmFsaWRhdGVfZHdvcmspOworCWhkY3Bfdy0+ZW5jcnlwdGlvbl9zdGF0dXMg
PSBNT0RfSERDUF9FTkNSWVBUSU9OX1NUQVRVU19IRENQX09GRjsKKwogCXByb2Nlc3Nfb3V0cHV0
KGhkY3Bfdyk7CiAKIAltdXRleF91bmxvY2soJmhkY3Bfdy0+bXV0ZXgpOwpAQCAtMTIwLDYgKzEy
Nyw5IEBAIHZvaWQgaGRjcF9yZXNldF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRj
cF93b3JrLCB1bnNpZ25lZCBpbnQgbGlua19pbmRlCiAKIAltb2RfaGRjcF9yZXNldF9jb25uZWN0
aW9uKCZoZGNwX3ctPmhkY3AsICAmaGRjcF93LT5vdXRwdXQpOwogCisJY2FuY2VsX2RlbGF5ZWRf
d29yaygmaGRjcF93LT5wcm9wZXJ0eV92YWxpZGF0ZV9kd29yayk7CisJaGRjcF93LT5lbmNyeXB0
aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCiAJcHJv
Y2Vzc19vdXRwdXQoaGRjcF93KTsKIAogCW11dGV4X3VubG9jaygmaGRjcF93LT5tdXRleCk7CkBA
IC0xNTUsNyArMTY1LDU4IEBAIHN0YXRpYyB2b2lkIGV2ZW50X2NhbGxiYWNrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykKIAogCiB9CitzdGF0aWMgdm9pZCBldmVudF9wcm9wZXJ0eV91cGRhdGUo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQoreworCisJc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpo
ZGNwX3dvcmsgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGhkY3Bfd29ya3F1ZXVlLCBwcm9w
ZXJ0eV91cGRhdGVfd29yayk7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IgPSBoZGNwX3dvcmstPmFjb25uZWN0b3I7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGhk
Y3Bfd29yay0+YWNvbm5lY3Rvci0+YmFzZS5kZXY7CisJbG9uZyByZXQ7CisKKwlkcm1fbW9kZXNl
dF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsIE5VTEwpOworCW11dGV4
X2xvY2soJmhkY3Bfd29yay0+bXV0ZXgpOworCisKKwlpZiAoYWNvbm5lY3Rvci0+YmFzZS5zdGF0
ZS0+Y29tbWl0KSB7CisJCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90
aW1lb3V0KCZhY29ubmVjdG9yLT5iYXNlLnN0YXRlLT5jb21taXQtPmh3X2RvbmUsIDEwICogSFop
OworCisJCWlmIChyZXQgPT0gMCkgeworCQkJRFJNX0VSUk9SKCJIRENQIHN0YXRlIHVua25vd24h
IFNldHRpbmcgaXQgdG8gREVTSVJFRCIpOworCQkJaGRjcF93b3JrLT5lbmNyeXB0aW9uX3N0YXR1
cyA9IE1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCQl9CisJfQorCisJaWYg
KGhkY3Bfd29yay0+ZW5jcnlwdGlvbl9zdGF0dXMgPT0gTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFU
VVNfSERDUDFfT04pCisJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25u
ZWN0b3ItPmJhc2UsIERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKTsKKwllbHNl
CisJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25uZWN0b3ItPmJhc2Us
IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9ERVNJUkVEKTsKKworCisJbXV0ZXhfdW5sb2Nr
KCZoZGNwX3dvcmstPm11dGV4KTsKKwlkcm1fbW9kZXNldF91bmxvY2soJmRldi0+bW9kZV9jb25m
aWcuY29ubmVjdGlvbl9tdXRleCk7Cit9CisKK3N0YXRpYyB2b2lkIGV2ZW50X3Byb3BlcnR5X3Zh
bGlkYXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgaGRjcF93b3JrcXVl
dWUgKmhkY3Bfd29yayA9CisJCWNvbnRhaW5lcl9vZih0b19kZWxheWVkX3dvcmsod29yayksIHN0
cnVjdCBoZGNwX3dvcmtxdWV1ZSwgcHJvcGVydHlfdmFsaWRhdGVfZHdvcmspOworCXN0cnVjdCBt
b2RfaGRjcF9kaXNwbGF5X3F1ZXJ5IHF1ZXJ5OworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9y
ICphY29ubmVjdG9yID0gaGRjcF93b3JrLT5hY29ubmVjdG9yOworCisJbXV0ZXhfbG9jaygmaGRj
cF93b3JrLT5tdXRleCk7CiAKKwlxdWVyeS5lbmNyeXB0aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VO
Q1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCW1vZF9oZGNwX3F1ZXJ5X2Rpc3BsYXkoJmhkY3Bf
d29yay0+aGRjcCwgYWNvbm5lY3Rvci0+YmFzZS5pbmRleCwgJnF1ZXJ5KTsKKworCWlmIChxdWVy
eS5lbmNyeXB0aW9uX3N0YXR1cyAhPSBoZGNwX3dvcmstPmVuY3J5cHRpb25fc3RhdHVzKSB7CisJ
CWhkY3Bfd29yay0+ZW5jcnlwdGlvbl9zdGF0dXMgPSBxdWVyeS5lbmNyeXB0aW9uX3N0YXR1czsK
KwkJc2NoZWR1bGVfd29yaygmaGRjcF93b3JrLT5wcm9wZXJ0eV91cGRhdGVfd29yayk7CisJfQor
CisJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZoZGNwX3dvcmstPnByb3BlcnR5X3ZhbGlkYXRlX2R3
b3JrLCBtc2Vjc190b19qaWZmaWVzKERSTV9IRENQX0NIRUNLX1BFUklPRF9NUykpOworCisJbXV0
ZXhfdW5sb2NrKCZoZGNwX3dvcmstPm11dGV4KTsKK30KIAogc3RhdGljIHZvaWQgZXZlbnRfd2F0
Y2hkb2dfdGltZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewpAQCAtMjUwLDggKzMxMSwx
MCBAQCBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3BfY3JlYXRlX3dvcmtxdWV1ZSh2b2lkICpw
c3BfY29udGV4dCwgc3RydWN0IGNwX3BzcCAqYwogCQltdXRleF9pbml0KCZoZGNwX3dvcmtbaV0u
bXV0ZXgpOwogCiAJCUlOSVRfV09SSygmaGRjcF93b3JrW2ldLmNwaXJxX3dvcmssIGV2ZW50X2Nw
aXJxKTsKKwkJSU5JVF9XT1JLKCZoZGNwX3dvcmtbaV0ucHJvcGVydHlfdXBkYXRlX3dvcmssIGV2
ZW50X3Byb3BlcnR5X3VwZGF0ZSk7CiAJCUlOSVRfREVMQVlFRF9XT1JLKCZoZGNwX3dvcmtbaV0u
Y2FsbGJhY2tfZHdvcmssIGV2ZW50X2NhbGxiYWNrKTsKIAkJSU5JVF9ERUxBWUVEX1dPUksoJmhk
Y3Bfd29ya1tpXS53YXRjaGRvZ190aW1lcl9kd29yaywgZXZlbnRfd2F0Y2hkb2dfdGltZXIpOwor
CQlJTklUX0RFTEFZRURfV09SSygmaGRjcF93b3JrW2ldLnByb3BlcnR5X3ZhbGlkYXRlX2R3b3Jr
LCBldmVudF9wcm9wZXJ0eV92YWxpZGF0ZSk7CiAKIAkJaGRjcF93b3JrW2ldLmhkY3AuY29uZmln
LnBzcC5oYW5kbGUgPSAgcHNwX2NvbnRleHQ7CiAJCWhkY3Bfd29ya1tpXS5oZGNwLmNvbmZpZy5k
ZGMuaGFuZGxlID0gZGNfZ2V0X2xpbmtfYXRfaW5kZXgoZGMsIGkpOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oCmluZGV4
IGNiNmM2ZmJkNzRmNi4uZDNiYTUwNWQwNjk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oCkBAIC0zOCw4ICszOCwx
MSBAQCBzdHJ1Y3QgY3BfcHNwOwogCiBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgewogCXN0cnVjdCB3
b3JrX3N0cnVjdCBjcGlycV93b3JrOworCXN0cnVjdCB3b3JrX3N0cnVjdCBwcm9wZXJ0eV91cGRh
dGVfd29yazsKIAlzdHJ1Y3QgZGVsYXllZF93b3JrIGNhbGxiYWNrX2R3b3JrOwogCXN0cnVjdCBk
ZWxheWVkX3dvcmsgd2F0Y2hkb2dfdGltZXJfZHdvcms7CisJc3RydWN0IGRlbGF5ZWRfd29yayBw
cm9wZXJ0eV92YWxpZGF0ZV9kd29yazsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNv
bm5lY3RvcjsKIAlzdHJ1Y3QgbXV0ZXggbXV0ZXg7CiAKIAlzdHJ1Y3QgbW9kX2hkY3AgaGRjcDsK
QEAgLTQ3LDEwICs1MCwxMiBAQCBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgewogCXN0cnVjdCBtb2Rf
aGRjcF9kaXNwbGF5IGRpc3BsYXk7CiAJc3RydWN0IG1vZF9oZGNwX2xpbmsgbGluazsKIAorCWVu
dW0gbW9kX2hkY3BfZW5jcnlwdGlvbl9zdGF0dXMgZW5jcnlwdGlvbl9zdGF0dXM7CiAJdWludDhf
dCBtYXhfbGluazsKIH07CiAKLXZvaWQgaGRjcF9hZGRfZGlzcGxheShzdHJ1Y3QgaGRjcF93b3Jr
cXVldWUgKmhkY3Bfd29yaywgdW5zaWduZWQgaW50IGxpbmtfaW5kZXgpOwordm9pZCBoZGNwX2Fk
ZF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrLCB1bnNpZ25lZCBpbnQg
bGlua19pbmRleCwKKwkJICAgICAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IpOwogdm9pZCBoZGNwX3JlbW92ZV9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqd29y
aywgdW5zaWduZWQgaW50IGxpbmtfaW5kZXgsIHVuc2lnbmVkIGludCBkaXNwbGF5X2luZGV4KTsK
IHZvaWQgaGRjcF9yZXNldF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqd29yaywgdW5z
aWduZWQgaW50IGxpbmtfaW5kZXgpOwogdm9pZCBoZGNwX2hhbmRsZV9jcGlycShzdHJ1Y3QgaGRj
cF93b3JrcXVldWUgKndvcmssIHVuc2lnbmVkIGludCBsaW5rX2luZGV4KTsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
