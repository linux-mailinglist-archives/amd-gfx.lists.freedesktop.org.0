Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3F67527
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 20:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A546E366;
	Fri, 12 Jul 2019 18:39:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBA66E366
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 18:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGEVJdA/uYjWp8t5KUxQdvW3KVfmnmgw5hVORGtuy2Mxohp4c9GpIYY30efiDizGPKa8HiLMvoQhGkkhQEE/ra7nIgjiaUfIP1z2i8OhQTjQeELc484jEyE8Amrh/iJX4MoHzr2rj8F5PfMsu8daPYuJaEkanU2ELr8FqCkrJZQvSOzO9UxhD/ggSvgpFnRB/DVVtvrCRDxfQ4B8XQvyoeSxwfL4CpwO1xvGX2DIRfOvEDhgvNbrTiW0MLi7Bk1u7ZSkpTK+aYkVZCwVRQUBJfY+NWrV8EtaWNt2V9JCicxake0bMj86TcN5W7WQUQyVjTnyFzJQmnuXKSNRjlmoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uip3bkWllZfZl9k6m3FFHCrN5Z9Pa1LpWkq7wHAccE=;
 b=DuLTpRf8HLoClDRPROOX4ptD68Uk1e+Wjf37o2djMcZ75RHDkG8VLPsevuIJqjKpLiLltncXSCiUdv/1l/SETuoeN0UPY/0Fb9hwH0nKpenoyVk/ZGNv7+TQkqaD4G9eJiSq7X6JVC5gg2R2O6za/iSmXoWCf9noMA+69RUIxGIa5c2Df1p8UdIp9ZPULk7OCT6rfsHARY1f/bFx0V6xvQ2wEfnAEGoUmugZcbOMSm5RTjPFJ3N50oxlWDGyYXfxNJrdGkTKxse8dvQdKX7NHoG49LcBSDd6r29RVdDKhWX/x09Ay+4bHVrD83z5dVjcocTMHTkv3jyfBi4ANxg6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4166.namprd12.prod.outlook.com (20.180.16.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 18:39:02 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2%4]) with mapi id 15.20.2073.012; Fri, 12 Jul 2019
 18:39:02 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: adding xgmi error monitoring
Thread-Topic: [PATCH 2/2] drm/amdgpu: adding xgmi error monitoring
Thread-Index: AQHVOOETieoS1F0LrUOnodYwoBksKA==
Date: Fri, 12 Jul 2019 18:39:02 +0000
Message-ID: <20190712183847.2897-2-jonathan.kim@amd.com>
References: <20190712183847.2897-1-jonathan.kim@amd.com>
In-Reply-To: <20190712183847.2897-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffde1fa7-4668-4b69-1f4e-08d706f835eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4166; 
x-ms-traffictypediagnostic: CH2PR12MB4166:
x-microsoft-antispam-prvs: <CH2PR12MB4166E13C137C7EF5FBEE17AB85F20@CH2PR12MB4166.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(199004)(189003)(2616005)(7736002)(66556008)(64756008)(66446008)(476003)(256004)(66476007)(68736007)(2501003)(305945005)(25786009)(71200400001)(71190400001)(446003)(36756003)(66946007)(1076003)(4326008)(11346002)(6436002)(486006)(6486002)(8676002)(386003)(6506007)(8936002)(50226002)(478600001)(6512007)(316002)(5640700003)(6116002)(3846002)(76176011)(102836004)(81166006)(53936002)(14454004)(81156014)(2906002)(86362001)(54906003)(52116002)(99286004)(6916009)(2351001)(26005)(5660300002)(186003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4166;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /MSxWm7Qm5HaBAxQY4NiHIWhGEo2glBnKdRhmE6h0ayu+q/Ngx0kEvyMOuc80M8SqW4KjjkI6Qi/kXpar9vC1L+2Aa+z6KnhnGxZo3dPlNzheTCyw5qpoKPqd7JlMnk/gWDkYbABTyUa6LHI1R6NsAXzAbCXvOr8LZbZoSoJ7H0/htXV6ma8gfsu/IgNSbS+gpjDOWCFUO8OG21gmoYcuT/Ennv0+xyYxvH4AcKRQ1xl6+0mX7GENi1QOe3Kdb05ULTgril2A1DRxG5b2iPKjiLh8Y4W1FIBtVHZzQ9nBSDBAI+NoRyPOKoKo/lFbUSFgHTC9zBjR0Zzu4tB9B5tIsIOItUFuKWd/leJuKZ2J094DafU41jDQhIEA+AR4WZc59wtsSWRUkM0M+yx+NsqxxUnHATfIJBbU9Qs3InVhcw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffde1fa7-4668-4b69-1f4e-08d706f835eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 18:39:02.3960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uip3bkWllZfZl9k6m3FFHCrN5Z9Pa1LpWkq7wHAccE=;
 b=VvA3Lt0vjd/tQC+edTiKvMPrEMgTUA5QaQcVl8K5b6Kqufbz70rEOZs3EZEsO6oQwgiKTBEwBbjFQD7HlKQIo3uLoDGYRl00cmFymoROhJ2PnO9+I/G5TGE6p0JGLYKiv7GwROAacBaYfC0mrpmfi+feC3tj0DWDY2RhGox4V/A=
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
