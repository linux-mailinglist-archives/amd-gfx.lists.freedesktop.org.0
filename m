Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878CA027A
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB914897C3;
	Wed, 28 Aug 2019 13:03:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CEB897C3
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrPpM998r1S0enmzBXqmGLGA2d/V10Nh5OWFQco6MmxXugnGLtckC3gwV8QJnmzTXZ0udg6zgt8X5Bqhla+zTFxRKsD9UZCowaopLRAQViXX3o8kVmIT0t4s3yUtamCYpP/iU8THX4Ren1x+SyqU+jxBpgiwg7jdDk4gNRfwsQC1X0e4Ds0dG2hLjnBNop7VCMvswyDBNWZ7NpJD9s7DwZsGLKbDiVroTlFbDJi8kVEFzeHRWrQ6Mg6ZaMFFnRBl+/zSabUKKCcWOmdNgQ7KnDQXFVUfdF2+Xxek6aCeqhRvRp3qAm0n8x27WhOPM1AL+nC7RUtAT3b5N4sAq1yy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ga+hQ/TGtyceoPGAHawoZrzrW8UkGRYSwam7t0NFZA=;
 b=CJmYy7Enxb2j2nIQzeFBfzLzJwv4SeR3xs9oIe3OUWVuo+hkH0K6HURP80u1BxBDFmUfdn70ymIvuROlxe7Td+UKa/+nBLIpt2sQSDpAXNz7NMzeVy2pLZetdAcFx+oAMLS7SWvQ8quchTs3KRBUHiQtQQm9jt96drXXih6rurt0+WJ2l47vqtODgnmHBrBc5NmJw7bb88qHbvHqfAYph6o6zzi0NJuYkGuF/YLf2OKI4z6IYLOaVIpZNWSfntpMkDJtegnDjtjyFaO8GMzN3+i59atDrX1StK0tEIHXBlRqGm20JVISBmWwpEh21QvQygfgKhdAuws2JSVE1BUnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:60::28)
 by MWHPR12MB1535.namprd12.prod.outlook.com (2603:10b6:301:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 13:03:29 +0000
Received: from BY2NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN8PR12CA0015.outlook.office365.com
 (2603:10b6:408:60::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.17 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT006.mail.protection.outlook.com (10.152.84.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:28 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:26 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 2/7] drm/amdgpu: switch to amdgpu_ras_late_init for gfx v9
 block
Date: Wed, 28 Aug 2019 21:03:10 +0800
Message-ID: <1566997395-7185-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(6636002)(8936002)(478600001)(76176011)(11346002)(51416003)(316002)(426003)(2906002)(47776003)(7696005)(446003)(50466002)(4326008)(50226002)(126002)(48376002)(53416004)(486006)(110136005)(476003)(70206006)(5660300002)(2616005)(70586007)(16586007)(305945005)(8676002)(186003)(336012)(6666004)(14444005)(36756003)(53936002)(356004)(81156014)(26005)(86362001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4aa17c7-8dfb-4e7d-a8ee-08d72bb81e9f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1535; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1535CFCE606E6EF0DAB2C177FCA30@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qVRj6vtUmSK3iOcBDSW4JKhLQ7yDYaAsdjkXpSnA9rmD7PSgVqrkvYszUuoNm0OvGCgUrw5Kq738KQDV9H3oU6zlNHiE3k9+LS2INiAkvSMTHIk20rIoi/pc8uXalI0YmC7bbmZnjXbzyBzdVwBQuTbw3TsvcmWOlu0Kny02IraOsdNGmsL5zM3nb8JMovdGnEX4GneH7qIg4ByP2H0g4TwJtXjleoTqGbnyCY1hvQAHjQEo+jn4ABUeFMQZg5UETEnHMuF9/AxF5jrDSQTTrngwLbbaHfH8Vyvjgo/XPvpHmVig2a76QUEcpQRqIx8PYE0oFM++JbAzbhQcVH70IvL+2TYUupaZcdDVCPCZWPujNJUkHyIrE7sgfW1G6xaStVcCGn0fO9RzfkmY+gnsGewppARRk95BYkNE6IDOKtE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:28.0348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4aa17c7-8dfb-4e7d-a8ee-08d72bb81e9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ga+hQ/TGtyceoPGAHawoZrzrW8UkGRYSwam7t0NFZA=;
 b=snggUf4CPXni9c7pv+rXqIX1ixkcQtpE4zgJA8s9RMtRG9dK7xTNyOpuLbTmE/vxuqib+5zYQccTGeub4ZCR8nDpNRUbatiiOVDkkKIJmizPDYsNmG5Bx/CZW06RsnO4te75nZuPTUOLe5uYwoiHzAIjvcHJFg4S7qrSKcPs5J8=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2FsbCBoZWxwZXIgZnVuY3Rpb24gaW4gbGF0ZSBpbml0IHBoYXNlIHRvIGhhbmRsZSByYXMgaW5p
dApmb3IgZ2Z4IGlwIGJsb2NrCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YyB8IDkwICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMKaW5kZXggYTZiY2JkZS4uNjJlYzQ1MSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCkBAIC00Mzg5LDcgKzQzODksNiBAQCBzdGF0aWMgaW50IGdmeF92
OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiBzdGF0
aWMgaW50IGdmeF92OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwotCXN0
cnVjdCByYXNfY29tbW9uX2lmICoqcmFzX2lmID0gJmFkZXYtPmdmeC5yYXNfaWY7CiAJc3RydWN0
IHJhc19paF9pZiBpaF9pbmZvID0gewogCQkuY2IgPSBnZnhfdjlfMF9wcm9jZXNzX3Jhc19kYXRh
X2NiLAogCX07CkBAIC00Mzk3LDE4ICs0Mzk2LDE4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNj
X2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJCS5zeXNmc19uYW1lID0gImdmeF9lcnJfY291bnQi
LAogCQkuZGVidWdmc19uYW1lID0gImdmeF9lcnJfaW5qZWN0IiwKIAl9OwotCXN0cnVjdCByYXNf
Y29tbW9uX2lmIHJhc19ibG9jayA9IHsKLQkJLmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fR0ZY
LAotCQkudHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEUsCi0JCS5z
dWJfYmxvY2tfaW5kZXggPSAwLAotCQkubmFtZSA9ICJnZngiLAotCX07CiAJaW50IHI7CiAKLQlp
ZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX0dGWCkp
IHsKLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsICZyYXNfYmxvY2ss
IDApOwotCQlyZXR1cm4gMDsKKwlpZiAoIWFkZXYtPmdmeC5yYXNfaWYpIHsKKwkJYWRldi0+Z2Z4
LnJhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5F
TCk7CisJCWlmICghYWRldi0+Z2Z4LnJhc19pZikKKwkJCXJldHVybiAtRU5PTUVNOworCQlhZGV2
LT5nZngucmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX0dGWDsKKwkJYWRldi0+Z2Z4
LnJhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7CisJ
CWFkZXYtPmdmeC5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CisJCXN0cmNweShhZGV2LT5n
ZngucmFzX2lmLT5uYW1lLCAiZ2Z4Iik7CiAJfQorCWZzX2luZm8uaGVhZCA9IGloX2luZm8uaGVh
ZCA9ICphZGV2LT5nZngucmFzX2lmOwogCiAJciA9IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fy
b3VuZHMoYWRldik7CiAJaWYgKHIpCkBAIC00NDE5LDcxICs0NDE4LDIwIEBAIHN0YXRpYyBpbnQg
Z2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYgKHIpCiAJCXJldHVybiBy
OwogCi0JLyogaGFuZGxlIHJlc3VtZSBwYXRoLiAqLwotCWlmICgqcmFzX2lmKSB7Ci0JCS8qIHJl
c2VuZCByYXMgVEEgZW5hYmxlIGNtZCBkdXJpbmcgcmVzdW1lLgotCQkgKiBwcmVwYXJlIHRvIGhh
bmRsZSBmYWlsdXJlLgotCQkgKi8KLQkJaWhfaW5mby5oZWFkID0gKipyYXNfaWY7Ci0JCXIgPSBh
bWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRldiwgKnJhc19pZiwgMSk7Ci0JCWlm
IChyKSB7Ci0JCQlpZiAociA9PSAtRUFHQUlOKSB7Ci0JCQkJLyogcmVxdWVzdCBhIGdwdSByZXNl
dC4gd2lsbCBydW4gYWdhaW4uICovCi0JCQkJYW1kZ3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29uX2Jv
b3QoYWRldiwKLQkJCQkJCUFNREdQVV9SQVNfQkxPQ0tfX0dGWCk7Ci0JCQkJcmV0dXJuIDA7Ci0J
CQl9Ci0JCQkvKiBmYWlsIHRvIGVuYWJsZSByYXMsIGNsZWFudXAgYWxsLiAqLwotCQkJZ290byBp
cnE7Ci0JCX0KLQkJLyogZW5hYmxlIHN1Y2Nlc3NmdWxseS4gY29udGludWUuICovCi0JCWdvdG8g
cmVzdW1lOwotCX0KLQotCSpyYXNfaWYgPSBrbWFsbG9jKHNpemVvZigqKnJhc19pZiksIEdGUF9L
RVJORUwpOwotCWlmICghKnJhc19pZikKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQkqKnJhc19pZiA9
IHJhc19ibG9jazsKLQotCXIgPSBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRl
diwgKnJhc19pZiwgMSk7Ci0JaWYgKHIpIHsKLQkJaWYgKHIgPT0gLUVBR0FJTikgewotCQkJYW1k
Z3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29uX2Jvb3QoYWRldiwKLQkJCQkJQU1ER1BVX1JBU19CTE9D
S19fR0ZYKTsKLQkJCXIgPSAwOwotCQl9Ci0JCWdvdG8gZmVhdHVyZTsKLQl9Ci0KLQlpaF9pbmZv
LmhlYWQgPSAqKnJhc19pZjsKLQlmc19pbmZvLmhlYWQgPSAqKnJhc19pZjsKLQotCXIgPSBhbWRn
cHVfcmFzX2ludGVycnVwdF9hZGRfaGFuZGxlcihhZGV2LCAmaWhfaW5mbyk7CisJciA9IGFtZGdw
dV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYsCisJCQkJICZmc19pbmZvLCAm
aWhfaW5mbyk7CiAJaWYgKHIpCi0JCWdvdG8gaW50ZXJydXB0OworCQlnb3RvIGZyZWU7CiAKLQlh
bWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKGFkZXYsICZmc19pbmZvKTsKLQotCXIgPSBhbWRncHVf
cmFzX3N5c2ZzX2NyZWF0ZShhZGV2LCAmZnNfaW5mbyk7Ci0JaWYgKHIpCi0JCWdvdG8gc3lzZnM7
Ci1yZXN1bWU6Ci0JciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vy
cm9yX2lycSwgMCk7Ci0JaWYgKHIpCi0JCWdvdG8gaXJxOworCWlmIChhbWRncHVfcmFzX2lzX3N1
cHBvcnRlZChhZGV2LCBhZGV2LT5nZngucmFzX2lmLT5ibG9jaykpIHsKKwkJciA9IGFtZGdwdV9p
cnFfZ2V0KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vycm9yX2lycSwgMCk7CisJCWlmIChyKQor
CQkJZ290byBmcmVlOworCX0KIAogCXJldHVybiAwOwotaXJxOgotCWFtZGdwdV9yYXNfc3lzZnNf
cmVtb3ZlKGFkZXYsICpyYXNfaWYpOwotc3lzZnM6Ci0JYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92
ZShhZGV2LCAqcmFzX2lmKTsKLQlhbWRncHVfcmFzX2ludGVycnVwdF9yZW1vdmVfaGFuZGxlcihh
ZGV2LCAmaWhfaW5mbyk7Ci1pbnRlcnJ1cHQ6Ci0JYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShh
ZGV2LCAqcmFzX2lmLCAwKTsKLWZlYXR1cmU6Ci0Ja2ZyZWUoKnJhc19pZik7Ci0JKnJhc19pZiA9
IE5VTEw7CitmcmVlOgorCWtmcmVlKGFkZXYtPmdmeC5yYXNfaWYpOwogCXJldHVybiByOwogfQog
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
