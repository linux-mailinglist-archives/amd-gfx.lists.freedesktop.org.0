Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1ADE81F
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 11:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A55894FF;
	Mon, 21 Oct 2019 09:33:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9A6894FF
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 09:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrDE3gDeJVYbO+kWWlkyGF7cz49r2fkqlwRUooe9OUunkzxl3B9mLg95RalBImQi4MYIlcu73aHPaP/ODEAjsXeC/OUkti1ssZbGYeQPyobsetQaUHkLnCQI25a4hgIir4Zb70DjUmO2hyN2gJy28ZchZEBPW1qyLlPGVUsP6GrjBGzByx6wZHUmpHzQo2rMtSS1hft9VtNjGpM30BYzVUPS11yGjtG3dNLd+2QaJX9Xbw22zq93RF2/F5HPJZCO6z0VSbKnQFyYOv2t2bt1FrJsfUE7AdNUkZOk5p8d4SKUVZjKZ6HkO3bwUtAAJ6N/RgME0U/EwqAVLWtfWP6vEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKfpMpjVq1GMZbZ2J3exevMR9kiPkcgXzU05JOwLLJI=;
 b=I+PLLFSnMgVjUJADxJQDhPrKvxoqnaaxSjwLWLrp5RnpYDTunIPdtPX5qzhxai0h1MkJQUM+kUEAUxAtP+WIgqzyFraOeAYyGbDxT6S1pKwBizIFoaIOCMBcx/ps3tt/RpmTz4Qq4t8tjn7jhk1+RefA+Xu3laL+ToQ43UIzadiC0k0f/OseZqta+2g8bUT1TYHpe9qRBNrQhxhs02uCnEZI/zS61yJ7IQlnMRQum3xGCggdiMi3RsB/5KJVrdGpcdilHB0x5hIeXGWWYv6sptpEOn0PZP5er+NZVPJn9/SuXyNWtdOvuPncdgvHM5jUk1XylFyVw3vKH4F3axef5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3302.namprd12.prod.outlook.com (20.179.91.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 09:33:05 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 09:33:05 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Index: AQHVh/KKgBKsqoknkku6xUwTjLtcVw==
Date: Mon, 21 Oct 2019 09:33:05 +0000
Message-ID: <20191021093245.28945-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0031.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::19) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db17f06e-eae8-4252-3f78-08d75609acfb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3302BA8E48AAEF6C13287B8EF1690@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(189003)(199004)(1076003)(71200400001)(486006)(54906003)(66556008)(476003)(64756008)(256004)(305945005)(26005)(66446008)(52116002)(66946007)(2616005)(6636002)(316002)(66476007)(386003)(110136005)(6506007)(99286004)(102836004)(71190400001)(8676002)(6436002)(81156014)(81166006)(2501003)(6512007)(25786009)(7736002)(50226002)(6486002)(8936002)(5660300002)(14454004)(6116002)(186003)(66066001)(36756003)(478600001)(4326008)(2906002)(86362001)(3846002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3302;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0G4tXnI3VoymdWaFrhWkQsEvHa2QsJMxzyhIcbpzoGCeuknRXxvg9nDE02NNDC9dc92/opTf3rvdVEqg1g/kisLpPt2Cvei/yY5WwktVNDNh/A0Ddu6zE6u5mDkboXtGa0qH42aayzw5yjVWulwv1PCe6he3abkgTJ0RZQw4zoGqcBnHHlBa30eJsor2nAPYTgafLtXHfcOhi19Zpysu0ojS2CQnAeY+VO7WkAYMwowDg3Aw0ampIxOodCY1QF4nbUY0ZJ1MFQePDilcu/5iX0a2J88EK9bNAOySOKHLNAKGZFyGcRW7nBgzSRwFMrypMnuK1Ex0x6eekB3EAxDzcRdsEMkpRzk+TZuNlKbn+cq/qpeXXSA1kZshCxfBUxi8x4JRdIvttaayxLfvScU54L5Iy41mGADIk6AnIPyDrayfVaagHWFSSyqNHOFda4yD
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db17f06e-eae8-4252-3f78-08d75609acfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 09:33:05.5004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H06K3s9eEVw8xUvc3NLM5309NZC5013rpJR8aDtg0bx8PLOkH44FUUkuC3tjT7qesCs4xeeGVeN7jrDa7OyWew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKfpMpjVq1GMZbZ2J3exevMR9kiPkcgXzU05JOwLLJI=;
 b=OXEt2F49Q/PxtyZaCOhVbqBo67cqeI9572Or73gAtpx4Fx2TeWPqYXXexEX4JbSX3igl6SSP6MEM5ktgrhQvTEL+uBai9gQxAqJ0blTFCuFubaoM1c/1jb0I0R8VdHCfKUevGYkZwHA9eE0kZO1HYvTQU2cDSCtO0Dk9JtrjuQc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmFzIHJlYm9vdCBkZWJ1Z2ZzIG5vZGUgYWxsb3dzIHVzZXIgb25lIGVhc3kgY29udHJvbCB0byBh
dm9pZApncHUgcmVjb3ZlcnkgaGFuZyBwcm9ibGVtIGFuZCBkaXJlY3RseSByZWJvb3Qgc3lzdGVt
IHBlciBjYXJkCmJhc2lzLCBhZnRlciByYXMgdW5jb3JyZWN0YWJsZSBlcnJvciBoYXBwZW5zLiBI
b3dldmVyLCBpdCBpcwpvbmUgY29tbW9uIGVudHJ5LCB3aGljaCBzaG91bGQgZ2V0IHJpZCBvZiBy
YXNfY3RybCBub2RlIGFuZApyZW1vdmUgaXAgZGVwZW5kZW5jZSB3aGVuIGlucHV0dGluZyBieSB1
c2VyLiBTbyBhZGQgb25lIG5ldwphdXRvX3JlYm9vdCBub2RlIGluIHJhcyBkZWJ1Z2ZzIGRpciB0
byBhY2hpZXZlIHRoaXMuCgp2MjogaW4gY29tbWl0IG1zc2FnZSwgYWRkIGp1c3RpZmljYXRpb24g
d2h5IHJhcyByZWJvb3QgZGVidWdmcwpub2RlIGlzIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IEd1
Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDU3ICsrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA2MjIwMzk0NTIxZTQuLjY0NTAwNjViODhk
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTUzLDggKzE1
Myw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1
Y3QgZmlsZSAqZiwKIAkJb3AgPSAxOwogCWVsc2UgaWYgKHNzY2FuZihzdHIsICJpbmplY3QgJTMy
cyAlOHMiLCBibG9ja19uYW1lLCBlcnIpID09IDIpCiAJCW9wID0gMjsKLQllbHNlIGlmIChzc2Nh
bmYoc3RyLCAicmVib290ICUzMnMiLCBibG9ja19uYW1lKSA9PSAxKQotCQlvcCA9IDM7CiAJZWxz
ZSBpZiAoc3RyWzBdICYmIHN0clsxXSAmJiBzdHJbMl0gJiYgc3RyWzNdKQogCQkvKiBhc2NpaSBz
dHJpbmcsIGJ1dCBjb21tYW5kcyBhcmUgbm90IG1hdGNoZWQuICovCiAJCXJldHVybiAtRUlOVkFM
OwpAQCAtMjE4LDEyICsyMTYsMTEgQEAgc3RhdGljIHN0cnVjdCByYXNfbWFuYWdlciAqYW1kZ3B1
X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIHZhbHVlIHRvIHRo
ZSBhZGRyZXNzLgogICoKICAqIFNlY29uZCBtZW1iZXI6IHN0cnVjdCByYXNfZGVidWdfaWY6Om9w
LgotICogSXQgaGFzIGZvdXIga2luZHMgb2Ygb3BlcmF0aW9ucy4KKyAqIEl0IGhhcyB0aHJlZSBr
aW5kcyBvZiBvcGVyYXRpb25zLgogICoKICAqIC0gMDogZGlzYWJsZSBSQVMgb24gdGhlIGJsb2Nr
LiBUYWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4KICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0aGUgYmxv
Y2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRhLgogICogLSAyOiBpbmplY3QgZXJyb3JzIG9uIHRo
ZSBibG9jay4gVGFrZSA6OmluamVjdCBhcyBpdHMgZGF0YS4KLSAqIC0gMzogcmVib290IG9uIHVu
cmVjb3ZlcmFibGUgZXJyb3IKICAqCiAgKiBIb3cgdG8gdXNlIHRoZSBpbnRlcmZhY2U/CiAgKiBw
cm9ncmFtczoKQEAgLTMwNSw5ICszMDIsNiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2Rl
YnVnZnNfY3RybF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKgogCQkv
KiBkYXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBpbnN0ZWFkIG9mIGFic29sdXRlIGdwdSBh
ZGRyZXNzICovCiAJCXJldCA9IGFtZGdwdV9yYXNfZXJyb3JfaW5qZWN0KGFkZXYsICZkYXRhLmlu
amVjdCk7CiAJCWJyZWFrOwotCWNhc2UgMzoKLQkJYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2
KS0+cmVib290ID0gdHJ1ZTsKLQkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0ID0gLUVJTlZBTDsK
IAkJYnJlYWs7CkBAIC0zNDYsNiArMzQwLDQ2IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNf
ZGVidWdmc19lZXByb21fd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyCiAJ
cmV0dXJuIHJldCA9PSAxID8gc2l6ZSA6IC1FSU87CiB9CiAKKy8qKgorICogRE9DOiBBTURHUFUg
UkFTIGRlYnVnZnMgYXV0byByZWJvb3QgaW50ZXJmYWNlCisgKgorICogQWZ0ZXIgb25lIHVuY29y
cmVjdGFibGUgZXJyb3IgaGFwcGVucywgR1BVIHJlY292ZXJ5IHdpbGwgYmUgc2NoZWR1bGVkLgor
ICogRHVlIHRvIHRoZSBrbm93biBwcm9ibGVtIGluIEdQVSByZWNvdmVyeSBmYWlsaW5nIHRvIGJy
aW5nIEdQVSBiYWNrLCB0aGlzCisgKiBpbnRlcmZhY2UgcHJvdmlkZXMgb25lIGRpcmVjdCB3YXkg
dG8gdXNlciB0byByZWJvb3Qgc3lzdGVtIGF1dG9tYXRpY2FsbHkKKyAqIGluIHN1Y2ggY2FzZSB3
aXRoaW4gRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGdlbmVyYXRlZC4gTm9ybWFsIEdQVSByZWNv
dmVyeQorICogcm91dGluZSB3aWxsIG5ldmVyIGJlIGNhbGxlZC4KKyAqCisgKiBFbmFibGUgYXV0
b19yZWJvb3Q6CisgKgorICoJZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpL3gvcmFzL2F1
dG9fcmVib290CisgKgorICogUmV2ZXJ0IGF1dG9fcmVib290OgorICoKKyAqIAllY2hvIDAgPiAv
c3lzL2tlcm5lbC9kZWJ1Zy9kcmkveC9yYXMvYXV0b19yZWJvb3QKKyAqCisgKi8KK3N0YXRpYyBz
c2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rfd3JpdGUoc3RydWN0IGZpbGUgKmYsCisJ
Y29uc3QgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IHNpemUsIGxvZmZfdCAqcG9zKQoreworCXN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0KKwkJKHN0cnVjdCBhbWRncHVfZGV2aWNlICopZmls
ZV9pbm9kZShmKS0+aV9wcml2YXRlOworCWNoYXIgdG1wWzhdID0gezB9OworCWludCB2YWx1ZSA9
IC0xOworCisJaWYgKHNpemUgIT0gc2ltcGxlX3dyaXRlX3RvX2J1ZmZlcih0bXAsIHNpemVvZih0
bXApLCBwb3MsIGJ1Ziwgc2l6ZSkpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKGtzdHJ0b2lu
dCh0bXAsIDEwLCAmdmFsdWUpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmICh2YWx1ZSA9PSAx
KQorCQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpLT5yZWJvb3QgPSB0cnVlOworCWVsc2Ug
aWYgKHZhbHVlID09IDApCisJCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9
IGZhbHNlOworCisJcmV0dXJuIHNpemU7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9v
cGVyYXRpb25zIGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX29wcyA9IHsKIAkub3duZXIgPSBUSElT
X01PRFVMRSwKIAkucmVhZCA9IE5VTEwsCkBAIC0zNjAsNiArMzk0LDEzIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fb3BzID0g
ewogCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2VlawogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBm
aWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYm9vdF9vcHMgPSB7CisJLm93bmVy
ID0gVEhJU19NT0RVTEUsCisJLnJlYWQgPSBOVUxMLAorCS53cml0ZSA9IGFtZGdwdV9yYXNfZGVi
dWdmc19yZWJvb3Rfd3JpdGUsCisJLmxsc2VlayA9IGRlZmF1bHRfbGxzZWVrCit9OworCiAvKioK
ICAqIERPQzogQU1ER1BVIFJBUyBzeXNmcyBFcnJvciBDb3VudCBJbnRlcmZhY2UKICAqCkBAIC0x
MDM3LDYgKzEwNzgsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlX2N0
cmxfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCQlhZGV2LCAmYW1kZ3B1X3Jh
c19kZWJ1Z2ZzX2N0cmxfb3BzKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfZWVwcm9tX3Jl
c2V0IiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAogCQkJCWFkZXYsICZhbWRncHVfcmFz
X2RlYnVnZnNfZWVwcm9tX29wcyk7CisJZGVidWdmc19jcmVhdGVfZmlsZSgiYXV0b19yZWJvb3Qi
LCBTX0lXVUdPIHwgU19JUlVHTywgY29uLT5kaXIsCisJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVi
dWdmc19yZWJvb3Rfb3BzKTsKIH0KIAogdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
