Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F3926E9
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C242A6E15E;
	Mon, 19 Aug 2019 14:35:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8A06E153
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpWUUfKHQIqXJPwE++rEoTzIpNQkPwzLgu6l71bdFN7SJva+3+7CvD7R0BxUIodpOQlTr/Vi5DMfMr79MNYnIjL45222HdNgy52FEPnmLYoGNX2F8HLwgxRnT0fnAbAjHdwZq7UkRltuDkvPqMbIaZcGSxgRYV0a/UGt/jNKWo8tZ9PVx+ZhjRyd6YuPO2h987gYOcAqDmgYC0mMiTuC7TbfRaXVxnFaUkdXf1LwYPoQe4TZABFpdvdgNqo/RBoG6gabQluwOtQcg9TS0MgonH4v1aBv5BftgIcTAQsHLedq6aDOzITOr0xY2GXQA92K+qRKfMRlvGoZisb82dccSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc+iS2qeL9DEJ3rkaK0RuzWdiS/vOpmC2ZvJrkxo6V8=;
 b=bC4IOzpTnqaT4tus0d+K0fnRdvkaOypUyof+G7hvGWtYt+x34g4fx+lUsAL8xepfAihfRUMNxIIMnt8VJnryqv2Dg9niXiUuiaBUv1WmPyTyuypOM/JFOkj443gn/aLIIJ6EUCTlYSUA0Av8hVzK3U+qLEBZBN1qHhCgz1QjoX4EUirvN/+4xNv00XsEetz15GTS1JfpMlqIgw0K1eDo825zV9pNYr72J18SiAa61dQ6/w5aFWbNBBI0j21IqhFLYAM/52d0j6k5ZsZUVbhP9DMVf/kNOd2O6DicUJo66YqXfo1DfDq0aUtXPMXKJSd6XqvwNdGm6yY6zeStx6z3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:45 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:44 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:40 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/36] drm/amd/display: fix dp stream enable
Date: Mon, 19 Aug 2019 10:34:45 -0400
Message-ID: <20190819143515.21653-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(2906002)(356004)(476003)(51416003)(81156014)(76176011)(316002)(7696005)(16586007)(8676002)(81166006)(5660300002)(36756003)(4326008)(8936002)(70206006)(70586007)(50226002)(50466002)(186003)(305945005)(11346002)(48376002)(86362001)(6916009)(2351001)(47776003)(26005)(336012)(53416004)(486006)(1076003)(53936002)(2616005)(478600001)(126002)(426003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d3ac44-9bce-4c96-2bc5-08d724b2850a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2708FEA1FBA0B17685ADC34FF9A80@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fC4DUBE48WBHmzoKGL9yBC9c0SLIFDEMezWlMsfAgyNX3JSnx1qpTsf1qCbGrqR3vqt9gkS0IQvEAb1VmE1bgi76ZDiRcxoFk0LnSLBfmosWrXh4GRwLNrzjFgP0oKKZmasj/dZGzHG0yAOe1X8W/R8/KIGLNmgDYGZPk990KleNv7u7PDB4R3BZgi7KjTMivObdy7ofq7LZh/PLTiccBzi5prK2gs4t+Jb4a5sn7VkvA8fHYzKw51Gmz+I0awYT0Uymvc0e0TSu6cmDcVrBAzHgBIKlnANUzD8lXDLE/ZWZJONh0hK+/lS2iuJRz69jtMY79F9uOketklujHkzgjiJx0djY3u+uatWhJCcfVP6v3uE9eH2vvK5qT4gWMgDczaJKTJxk8iwlpk72vcQ+zWP8mifHOCumFvvvKTm36Sk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:44.9388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d3ac44-9bce-4c96-2bc5-08d724b2850a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc+iS2qeL9DEJ3rkaK0RuzWdiS/vOpmC2ZvJrkxo6V8=;
 b=yBkUEtqhZgvRt4HJuBIeUxCjY23CFByNEr6egFP+8X2ifWBhR/w3YYIRClU7ARgzVb6Wmak09r5QV25zCFVUwy2iECJkjWO12vy1iGotEuDocGTGoh4yxNrcMCbiFOerg/pmwXjx3834jU0m/L1VvcWEXgaZQtxoGm1mjzlvADI=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkEg
cHJldmlvdXMgb2RtIGNoYW5nZSBicm9rZSBzdHJlYW0gZW5hYmxlIGJ5IGFsd2F5cyBzZXR0aW5n
Cm5fbXVsdGlwbHkgYXMgaWYgb2RtIHdhcyBvbi4KClRoaXMgZml4ZXMgdGhlIGNoZWNrIGZvciBv
ZG0gYnkgbWFraW5nIHN1cmUgb3BwIGNvdW50IGlzID4xCnJhdGhlciB0aGFuIG5vdCAwLgoKU2ln
bmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyAgICAgICAg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0
cmVhbV9lbmNvZGVyLmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9od3NlcS5jCmluZGV4IGFlZTYyNDM3MTcyOC4uODdiYThlZmM1MWFiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YwpAQCAtMTU4NSwxMCArMTU4NSwxMCBAQCB2b2lkIGRjbjIwX3VuYmxhbmtfc3RyZWFtKHN0cnVj
dCBwaXBlX2N0eCAqcGlwZV9jdHgsCiAJcGFyYW1zLmxpbmtfc2V0dGluZ3MubGlua19yYXRlID0g
bGlua19zZXR0aW5ncy0+bGlua19yYXRlOwogCiAJaWYgKGRjX2lzX2RwX3NpZ25hbChwaXBlX2N0
eC0+c3RyZWFtLT5zaWduYWwpKSB7Ci0JCWlmIChvcHRjMV9pc190d29fcGl4ZWxzX3Blcl9jb250
YWludGVyKCZzdHJlYW0tPnRpbWluZykgfHwgcGFyYW1zLm9wcF9jbnQpCisJCWlmIChvcHRjMV9p
c190d29fcGl4ZWxzX3Blcl9jb250YWludGVyKCZzdHJlYW0tPnRpbWluZykgfHwgcGFyYW1zLm9w
cF9jbnQgPiAxKQogCQkJcGFyYW1zLnRpbWluZy5waXhfY2xrXzEwMGh6IC89IDI7CiAJCXBpcGVf
Y3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5kcF9zZXRfb2RtX2NvbWJpbmUoCi0J
CQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywgcGFyYW1zLm9wcF9jbnQpOworCQkJ
CXBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsIHBhcmFtcy5vcHBfY250ID4gMSk7CiAJ
CXBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5kcF91bmJsYW5rKHBpcGVf
Y3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsICZwYXJhbXMpOwogCX0KIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfc3RyZWFtX2Vu
Y29kZXIuYwppbmRleCA0ODhmYjVjNzFkZDAuLjJlZDNiNTYxZWJiZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9l
bmNvZGVyLmMKQEAgLTQ2Niw3ICs0NjYsNyBAQCB2b2lkIGVuYzJfc3RyZWFtX2VuY29kZXJfZHBf
dW5ibGFuaygKIAkJdWludDY0X3QgbV92aWRfbCA9IG5fdmlkOwogCiAJCS8qIFlDYkNyIDQ6Mjow
IDogQ29tcHV0ZWQgVklEX00gd2lsbCBiZSAyWCB0aGUgaW5wdXQgcmF0ZSAqLwotCQlpZiAoaXNf
dHdvX3BpeGVsc19wZXJfY29udGFpbnRlcigmcGFyYW0tPnRpbWluZykgfHwgcGFyYW0tPm9wcF9j
bnQpIHsKKwkJaWYgKGlzX3R3b19waXhlbHNfcGVyX2NvbnRhaW50ZXIoJnBhcmFtLT50aW1pbmcp
IHx8IHBhcmFtLT5vcHBfY250ID4gMSkgewogCQkJLyp0aGlzIGxvZ2ljIHNob3VsZCBiZSB0aGUg
c2FtZSBpbiBnZXRfcGl4ZWxfY2xvY2tfcGFyYW1ldGVycygpICovCiAJCQluX211bHRpcGx5ID0g
MTsKIAkJfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
