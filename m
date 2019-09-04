Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C69A9727
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 01:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E1189C69;
	Wed,  4 Sep 2019 23:31:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D51589C69
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 23:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvRig98iTmvWi2be2HdO5k6qa3naIdEWd0GSx+ctsR4mupnO4HHlC6ujBcM3vxjho5wp+kUKbch3JFIVnYkD2HfsEKVWmD4GEy40HengvCP5cpc2D2SnEBYwxIli94StsajB8JJjjnw3R/XHh/DBjBopSuOhYpQ9ZW5KF4I8dnvFfKdh/DW0a+Y5VYtr/h1hkyNrzNtg3f58OLCr70zKH1LKLFCyuBQfRHdLtolXVkufwZXn3wAvWFFToG0yfWPoyde5ZeTWmpGpe8IhdOaTiewjhdVbT7vTL7IcmnrSbf/KgSQ8DSmIuyFo/Umye3O0qjr7tB80fbIdB72xOBztUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibISSoES78YlDERDj3uTvmhSCw8K+PvjdlN1P6zoyrE=;
 b=DwCHZNpxdX/AFbSkSLyjmobXj/GCDWMM533r1loSMcEMJmKarshD0uF+LZxpbUjfvr68U0Cp9RQNJvvpJWS531cJJ2JB+x3JQ5cX2SPTHXJVgoZFE6pUI0IShWnB7SRVss3p+aRxS6+5Vur+l2VEL7PKvwM9j+gEbRR8tXgePlnUFtpb8GXWbNjj0oj/PbVULrGCWlbMds2Da5f9h37dRDg+uiTjfcDocLoHFl84E6dWxxwp90Z+iCS7JolQ1mQWtvQdvQQADneHdkAcpSdP69UTouNEeslGXzwfgX3A6tzONlDzxK0KTmgbHGf6rEuc4FrX4I+9M3e1OCX+uiE71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3689.namprd12.prod.outlook.com (10.255.76.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Wed, 4 Sep 2019 23:31:11 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 23:31:11 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Topic: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Index: AQHVY3jVRndyicN57kSyNNfIH3Ofqw==
Date: Wed, 4 Sep 2019 23:31:11 +0000
Message-ID: <20190904233053.9767-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bd4e87a-758d-4541-5822-08d7318ff836
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3689; 
x-ms-traffictypediagnostic: DM6PR12MB3689:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3689314CBB1DC782DA8D4D0392B80@DM6PR12MB3689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(1076003)(102836004)(36756003)(2616005)(476003)(81156014)(81166006)(66066001)(316002)(6916009)(6486002)(6506007)(386003)(25786009)(5660300002)(14454004)(486006)(66946007)(66556008)(64756008)(66476007)(66446008)(478600001)(26005)(4326008)(3846002)(50226002)(7736002)(2906002)(86362001)(6116002)(8936002)(305945005)(256004)(5640700003)(186003)(6512007)(2351001)(53936002)(6436002)(99286004)(52116002)(71200400001)(2501003)(71190400001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3689;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iAQns3JXfu+GcuqtWjYWMI2tJ+jmLxqOMGVkVtiESWJPzdyQwsYzDdpvfNGTpF8q5DhCp7r9L4PKuEA6OHFaJ7VSq4LOMTaJyNoovaXIsJ1VNbPIY/4Dw+3l20FWx2n3NDVN1LyrdPDWEFy6Gt369U/TRIfs2tIEoXRVmsf10G1TI85kDggmo0XMmloLQxbEBt/QdNcVyop/aBuCLbQErefSfVQDMwoDewf7aqLmGM3Wi8iYIQeuK6D3fhKeG2S1/O8OOAfj3lUFu8DsAmIlTsJSz1oU1ilxFcyVtiS0YPx8nRnqeEgA3jnbVrwx31Cmy4sgR+gKxeQBb3QWiNpul6av/I2eGIf561/+Ukejd60rYw0HkZABDq8+H9wmivQbY7l64FJo1llO98BagbO4PaDTbXW2sm6LNVEXS9zy6eg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd4e87a-758d-4541-5822-08d7318ff836
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 23:31:11.2139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXe+qD2HN+ZmJmodMTNlH6pxpU6xq2OiEiqAF3Hwh0BCLxklMTCjzU1LRnMO8QIVdvq66aKCiGi6jrAjYuu/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3689
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibISSoES78YlDERDj3uTvmhSCw8K+PvjdlN1P6zoyrE=;
 b=qkaP51hHHM39we7xK2aXoyDBwpizndAWwwDyHcW51TSfkwvpdIe9CtDFzuYHiIgca+PYpGAPyMOTI3W4jRnzlR8iZHZXwsoFilnYllVV6AiUTMlp4gt3L4a+7aTuJdJduzMIGog3yWtPJGA4/o+pT6EK0Zy5jJx7cynEcsNPL3o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gcG9pbnQgcmV0cnlpbmcgcGFnZSBmYXVsdHMgaW4gVk1JRDAuIFRob3NlIGZh
dWx0cyBhcmUKYWx3YXlzIGZhdGFsLgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
aHViX3YxXzAuYyB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8w
LmMgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgIHwgMiAr
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jICB8IDIgKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyAgfCAyICsrCiA1IGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhodWJfdjFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3Yx
XzAuYwppbmRleCA2Y2UzN2NlNzdkMTQuLjllYzQyOTdlNjFlNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jCkBAIC0xNzgsNiArMTc4LDggQEAgc3RhdGljIHZvaWQg
Z2Z4aHViX3YxXzBfZW5hYmxlX3N5c3RlbV9kb21haW4oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbVZNX0NPTlRFWFQwX0NOVEwpOwogCXRt
cCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhUMF9DTlRMLCBFTkFCTEVfQ09OVEVYVCwg
MSk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0NPTlRFWFQwX0NOVEwsIFBBR0VfVEFC
TEVfREVQVEgsIDApOworCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhUMF9DTlRM
LAorCQkJICAgIFJFVFJZX1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULCAwKTsKIAlX
UkVHMzJfU09DMTUoR0MsIDAsIG1tVk1fQ09OVEVYVDBfQ05UTCwgdG1wKTsKIH0KIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMKaW5kZXggOGI3ODlmNzUwYjcyLi5hOTIz
ODczNWQzNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92
Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwpAQCAt
MTY2LDYgKzE2Niw4IEBAIHN0YXRpYyB2b2lkIGdmeGh1Yl92Ml8wX2VuYWJsZV9zeXN0ZW1fZG9t
YWluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXRtcCA9IFJSRUczMl9TT0MxNShHQywg
MCwgbW1HQ1ZNX0NPTlRFWFQwX0NOVEwpOwogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBHQ1ZN
X0NPTlRFWFQwX0NOVEwsIEVOQUJMRV9DT05URVhULCAxKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxE
KHRtcCwgR0NWTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsKKwl0bXAgPSBS
RUdfU0VUX0ZJRUxEKHRtcCwgR0NWTV9DT05URVhUMF9DTlRMLAorCQkJICAgIFJFVFJZX1BFUk1J
U1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULCAwKTsKIAlXUkVHMzJfU09DMTUoR0MsIDAsIG1t
R0NWTV9DT05URVhUMF9DTlRMLCB0bXApOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
bWh1Yl92MV8wLmMKaW5kZXggYjlkNmMwYmZhNTk0Li40YzdlOGM2NGE5NGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKQEAgLTIwNyw2ICsyMDcsOCBAQCBzdGF0aWMg
dm9pZCBtbWh1Yl92MV8wX2VuYWJsZV9zeXN0ZW1fZG9tYWluKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCXRtcCA9IFJSRUczMl9TT0MxNShNTUhVQiwgMCwgbW1WTV9DT05URVhUMF9DTlRM
KTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fQ09OVEVYVDBfQ05UTCwgRU5BQkxFX0NP
TlRFWFQsIDEpOwogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhUMF9DTlRMLCBQ
QUdFX1RBQkxFX0RFUFRILCAwKTsKKwl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fQ09OVEVY
VDBfQ05UTCwKKwkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwg
MCk7CiAJV1JFRzMyX1NPQzE1KE1NSFVCLCAwLCBtbVZNX0NPTlRFWFQwX0NOVEwsIHRtcCk7CiB9
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYwppbmRleCAzNTQyYzIwM2Mz
YzguLjg2ZWQ4Y2I5MTVhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bW1odWJfdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAu
YwpAQCAtMTUyLDYgKzE1Miw4IEBAIHN0YXRpYyB2b2lkIG1taHViX3YyXzBfZW5hYmxlX3N5c3Rl
bV9kb21haW4oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdG1wID0gUlJFRzMyX1NPQzE1
KE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDBfQ05UTCk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0
bXAsIE1NVk1fQ09OVEVYVDBfQ05UTCwgRU5BQkxFX0NPTlRFWFQsIDEpOwogCXRtcCA9IFJFR19T
RVRfRklFTEQodG1wLCBNTVZNX0NPTlRFWFQwX0NOVEwsIFBBR0VfVEFCTEVfREVQVEgsIDApOwor
CXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBNTVZNX0NPTlRFWFQwX0NOVEwsCisJCQkgICAgUkVU
UllfUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFVTFQsIDApOwogCVdSRUczMl9TT0MxNShN
TUhVQiwgMCwgbW1NTVZNX0NPTlRFWFQwX0NOVEwsIHRtcCk7CiB9CiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L21taHViX3Y5XzQuYwppbmRleCAwY2Y3ZWY0NGI0YjUuLjY1Nzk3MGY5ZWJmYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYwpAQCAtMjQwLDYgKzI0MCw4
IEBAIHN0YXRpYyB2b2lkIG1taHViX3Y5XzRfZW5hYmxlX3N5c3RlbV9kb21haW4oc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVS
X09GRlNFVCk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNTDJWQzBfVk1fQ09OVEVYVDBf
Q05UTCwgRU5BQkxFX0NPTlRFWFQsIDEpOwogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTUwy
VkMwX1ZNX0NPTlRFWFQwX0NOVEwsIFBBR0VfVEFCTEVfREVQVEgsIDApOworCXRtcCA9IFJFR19T
RVRfRklFTEQodG1wLCBWTUwyVkMwX1ZNX0NPTlRFWFQwX0NOVEwsCisJCQkgICAgUkVUUllfUEVS
TUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFVTFQsIDApOwogCVdSRUczMl9TT0MxNV9PRkZTRVQo
TU1IVUIsIDAsIG1tVk1MMlZDMF9WTV9DT05URVhUMF9DTlRMLAogCQkJICAgIGh1YmlkICogTU1I
VUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULCB0bXApOwogfQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
