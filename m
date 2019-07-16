Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6F6AD61
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 19:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680FD6E15B;
	Tue, 16 Jul 2019 17:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6D6E15A
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 17:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX4Ln+LqT95QLHM/0NuWqbannL/QjIP57rSFpXImdQMqD+c/CFLYIe06M9n6t5grb2ue6CxH7s7ssnf54fkkvs2S/BJApA2S3/pGT4u+F86E8i3sAGbEF9qnqhZm16tD1SYbpLbbSNuQyrAeawIu8eWfO4IRB740jXfxc53aMEvJjw3YvEgXSdVXnTpSCtzaieEAgvNOdboYXMRMqAW0W8DPASfU5fNPatTHWbwxANgS0lQEXbNHrd6twgMC2P4J8zj6IeZthRpom8B3LQxLFLyC4tDlfiikfFUNBvauDg0zn6DtA3VvJYTZBbXeb8/iXgfRSe+Px18674kI39ikZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uip3bkWllZfZl9k6m3FFHCrN5Z9Pa1LpWkq7wHAccE=;
 b=m7rsis6CZ4dG4sNXO3TXda6S2Ff7+I8CIlaV4E+rWDYbV0YyspklOJcKRIposcBZm5oYHRYMI2kh27IAQl4GG/CbwnRHQQiBkLjJ1QyMC5QISzDXQY95ew3eCMGmSVEwhhXoqRAZ9FGSnehQ46t648VDarcFu2S/TKgwC1jp2ttMKZNj8/UmO09S4Dt0+LMGzZ/Vb8h5U9yeI3+HfaRR1Rk4S7dQLiIU2Cl33+IVzp/WgqWSN9YBBWe5DfKuNvpv7AMNGqFI1QLMWx6xauhfB7qK7zH0T9xw3hIJpDmSfusnXB01pTBeOImbw/795z+3YTKab6zSKRPo9FPJzhJSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3782.namprd12.prod.outlook.com (52.132.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 17:08:43 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2%4]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 17:08:43 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Topic: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Index: AQHVO/kflRXBCjvvDUequEiOzw6+5w==
Date: Tue, 16 Jul 2019 17:08:43 +0000
Message-ID: <20190716170825.97385-2-jonathan.kim@amd.com>
References: <20190716170825.97385-1-jonathan.kim@amd.com>
In-Reply-To: <20190716170825.97385-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 994df561-f91b-419d-0123-08d70a1041b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3782; 
x-ms-traffictypediagnostic: CH2PR12MB3782:
x-microsoft-antispam-prvs: <CH2PR12MB3782DE83807B7A1EE57D83A785CE0@CH2PR12MB3782.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(2501003)(2351001)(5640700003)(8676002)(476003)(11346002)(2616005)(6916009)(446003)(66066001)(6486002)(486006)(14454004)(2906002)(386003)(6506007)(6436002)(102836004)(52116002)(256004)(76176011)(36756003)(26005)(186003)(66476007)(66556008)(66946007)(3846002)(6116002)(50226002)(66446008)(71190400001)(71200400001)(99286004)(316002)(54906003)(7736002)(6512007)(68736007)(81156014)(5660300002)(81166006)(53936002)(478600001)(8936002)(86362001)(4326008)(64756008)(1076003)(305945005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3782;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gyx1f0zYUq310EcWHlqb0hxJncWNhcOkTJZm5+Z/cbmmtnvrhC4gMKqHfAc7Ztnd9Wt+/Z4pmzaFAEOEdGuI5KBbTcCzUDuiSWgNliG++Xt+92hinijghkkaYBEKfUwMqVY5LWg/PXzDgRrv+sXluZlf3EHbPvmJZjr0QHz5h2KHz7b2x5TiR/3Nzalpi7B2lTcLtNxuO8mMfyGSyQlcA7nNP2TUU6ZbIxgeWYuKnodwvXBVt5MEWRnohCsB5WX7W9Gb+E4lX6HI6YRD4hE6G5/meyjfJ3X2y+ABmxBMQv60HdmZg2LO67sc4Wh24PXkJ1SD/YUaRbBP8qxMyfLIOeWBSJiHY+ycs+VGoQR2YouA2INClDnWFjW8WBkznTTRH/a9yw+t0ZjD+yZIEWBLBaSMToxfZ90EGZ/k775XeBI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994df561-f91b-419d-0123-08d70a1041b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 17:08:43.6400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uip3bkWllZfZl9k6m3FFHCrN5Z9Pa1LpWkq7wHAccE=;
 b=IyqCPnGrD4M/HCN3ovQRTxyjKNWdTwMA0RnoAlOIQyE0WxyD639/+5ZvGodVELDiiW/HgHip8Gv5uddQflkSBCdCSKS4HJtQS3Vdqw1S99zKNn3mT0lQ9pJ0m8tnVeQUIMDYQ/QNclb2KJqfvMcvwPqAwE3mDZHjhcYI7zu4pf0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bW9uaXRvciB4Z21pIGVycm9ycyB2aWEgbWMgcGllIHN0YXR1cyB0aHJvdWdoIGZpY2EgcmVnaXN0
ZXJzLgoKQ2hhbmdlLUlkOiBJZDgwYjZjMmY2MzVhMjk0YWZlMzQzY2Y1NWEwMzkwMmU5YTE3ODdh
NQpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgfCAzOCArKysrKysrKysr
KysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94
Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jCmluZGV4IGQx
MWViYTA5ZWFkZC4uNGI4N2ZkYTE1YWM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfeGdtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV94Z21pLmMKQEAgLTI1LDcgKzI1LDcgQEAKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNs
dWRlICJhbWRncHVfeGdtaS5oIgogI2luY2x1ZGUgImFtZGdwdV9zbXUuaCIKLQorI2luY2x1ZGUg
ImRmL2RmXzNfNl9vZmZzZXQuaCIKIAogc3RhdGljIERFRklORV9NVVRFWCh4Z21pX211dGV4KTsK
IApAQCAtMTMxLDkgKzEzMSwzNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfeGdtaV9zaG93X2Rl
dmljZV9pZChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIH0KIAorI2RlZmluZSBBTURHUFVfWEdNSV9T
RVRfRklDQUEobykJKChvKSB8IDB4NDU2ODAxKQorc3RhdGljIHNzaXplX3QgYW1kZ3B1X3hnbWlf
c2hvd19lcnJvcihzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJICAgICAgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsCisJCQkJICAgICAgY2hhciAqYnVmKQoreworCXN0cnVjdCBkcm1fZGV2
aWNlICpkZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKKwl1aW50MzJfdCBmaWNhYV9waWVfY3RsX2luLCBm
aWNhYV9waWVfc3RhdHVzX2luOworCXVpbnQ2NF90IGZpY2Ffb3V0OworCXVuc2lnbmVkIGludCBl
cnJvcl9jb3VudCA9IDA7CisKKwlmaWNhYV9waWVfY3RsX2luID0gQU1ER1BVX1hHTUlfU0VUX0ZJ
Q0FBKDB4MjAwKTsKKwlmaWNhYV9waWVfc3RhdHVzX2luID0gQU1ER1BVX1hHTUlfU0VUX0ZJQ0FB
KDB4MjA4KTsKIAotc3RhdGljIERFVklDRV9BVFRSKHhnbWlfZGV2aWNlX2lkLCBTX0lSVUdPLCBh
bWRncHVfeGdtaV9zaG93X2RldmljZV9pZCwgTlVMTCk7CisJZmljYV9vdXQgPSBhZGV2LT5kZl9m
dW5jcy0+Z2V0X2ZpY2EoYWRldiwgZmljYWFfcGllX2N0bF9pbik7CisJaWYgKGZpY2Ffb3V0ICE9
IDB4MWYpCisJCXByX2VycigieEdNSSBlcnJvciBjb3VudGVycyBub3QgZW5hYmxlZCFcbiIpOwor
CisJZmljYV9vdXQgPSBhZGV2LT5kZl9mdW5jcy0+Z2V0X2ZpY2EoYWRldiwgZmljYWFfcGllX3N0
YXR1c19pbik7CisKKwlpZiAoKGZpY2Ffb3V0ICYgMHhmZmZmKSA9PSAyKQorCQllcnJvcl9jb3Vu
dCA9ICgoZmljYV9vdXQgPj4gNjIpICYgMHgxKSArIChmaWNhX291dCA+PiA2Myk7CiAKKwlhZGV2
LT5kZl9mdW5jcy0+c2V0X2ZpY2EoYWRldiwgZmljYWFfcGllX3N0YXR1c19pbiwgMCwgMCk7CisK
KwlyZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgZXJyb3JfY291bnQpOwor
fQorCisKK3N0YXRpYyBERVZJQ0VfQVRUUih4Z21pX2RldmljZV9pZCwgU19JUlVHTywgYW1kZ3B1
X3hnbWlfc2hvd19kZXZpY2VfaWQsIE5VTEwpOworc3RhdGljIERFVklDRV9BVFRSKHhnbWlfZXJy
b3IsIFNfSVJVR08sIGFtZGdwdV94Z21pX3Nob3dfZXJyb3IsIE5VTEwpOwogCiBzdGF0aWMgaW50
IGFtZGdwdV94Z21pX3N5c2ZzX2FkZF9kZXZfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAkJCQkJIHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZvICpoaXZlKQpAQCAtMTQ4LDYgKzE3Niwx
MiBAQCBzdGF0aWMgaW50IGFtZGdwdV94Z21pX3N5c2ZzX2FkZF9kZXZfaW5mbyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwkvKiBDcmVhdGUgeGdtaSBl
cnJvciBmaWxlICovCisJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9h
dHRyX3hnbWlfZXJyb3IpOworCWlmIChyZXQpCisJCXByX2VycigiZmFpbGVkIHRvIGNyZWF0ZSB4
Z21pX2Vycm9yXG4iKTsKKworCiAJLyogQ3JlYXRlIHN5c2ZzIGxpbmsgdG8gaGl2ZSBpbmZvIGZv
bGRlciBvbiB0aGUgZmlyc3QgZGV2aWNlICovCiAJaWYgKGFkZXYgIT0gaGl2ZS0+YWRldikgewog
CQlyZXQgPSBzeXNmc19jcmVhdGVfbGluaygmYWRldi0+ZGV2LT5rb2JqLCBoaXZlLT5rb2JqLAot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
