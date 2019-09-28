Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7CC0F84
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Sep 2019 05:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DCA6E0D3;
	Sat, 28 Sep 2019 03:41:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB466E0CB
 for <amd-gfx@lists.freedesktop.org>; Sat, 28 Sep 2019 03:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cw8XR172Uy+2reCtpVNWSzlv1M7qzY4Hu491mh7BHa/Q/zRh6/Ku+p2n4U9JnNnwVE1cGBCZDx6Gu0FsonI9ogR9DYrsoWM6DAY36DxV5JmFhJJprc51lJ0ZwDC0AdRs3EnCAg9Jpa/QnMl+T1dVfIFkfO6xB74mPlc502CQX98YYHh8Cygz6KD3DgW5wOannPvGPwK7YDmS7wd9KmR7CEd9bOd/n5qr2vpwKG104tqJxEl3RlARgDBVz7cq4F9WcRAxhevbneCfx2whrS7yWp+d6JEIlAW38H53iGMna+EUGSi81cQHaJNyIW1xFlbjn8klmA1OY5/2f152b9UK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/91k1oPUnZyXM0PfQ28e/6E93L0T/ExqmVhI1F2JsRQ=;
 b=E6GOjN555R3Qrwq59a45DTjl5t4cKDmBColCf/CI2v+3AkwlrYg7+tvKNlPdm+d+l12azbxNf7uv91RsReiZBD7GMU9CkjmwcXCaZsyXNgp47uFwbDCyOm6L8ltsy6drCKLXBF0JkbUAWFY8PM9YdmQnnibfyQRiHhRZmlPt03swxGOo2dZ0OxeDj7sNDaR+zBsQ3f+oM51QCwYVBewi+JEcWzweeulojAI4BnMpsCIQ28MZRh8rWLQicWtNrmuAWcN2pMxhmbVkhxZcTnE1QQFFz7TC6qcJq9tyWE0BVV6RhnsVIVAObm3pKgppmi3/adXFhKCidn/0mH0fUww94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2809.namprd12.prod.outlook.com (20.176.117.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Sat, 28 Sep 2019 03:41:47 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.028; Sat, 28 Sep 2019
 03:41:47 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Topic: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Index: AQHVda6nMuaaGGKqQ0611nhju0hSwA==
Date: Sat, 28 Sep 2019 03:41:47 +0000
Message-ID: <20190928034132.28340-5-Yong.Zhao@amd.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
In-Reply-To: <20190928034132.28340-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 286613bc-2ccd-40e0-2f4f-08d743c5c9be
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2809AB7353C57C7A46CF7F13F0800@DM6PR12MB2809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0174BD4BDA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(199004)(189003)(6486002)(26005)(50226002)(14444005)(2906002)(2351001)(6436002)(8936002)(5660300002)(186003)(7736002)(81166006)(256004)(102836004)(5640700003)(8676002)(6916009)(305945005)(66066001)(81156014)(3846002)(4326008)(25786009)(6116002)(71190400001)(71200400001)(2501003)(66446008)(6512007)(66556008)(66476007)(86362001)(2616005)(36756003)(1076003)(476003)(386003)(99286004)(11346002)(76176011)(478600001)(446003)(64756008)(6506007)(316002)(66946007)(14454004)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2809;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJpfrc/zqYoWuCgfSP5ij86e44UXutH+ZT2lP1bUq2YkcHCq8PgGzxWIjJmTZ255Sj/5OnogkR0VkXyjpPvR/19XZZttNdsb6d+77HapTQokQrcrQZWXijw2Zhqd9A3RR/aKMBrW/Sk/xilCPgQzTLqZm6j0PqI9OoREaBljY7WzR/oebP1vXhIuH8xSauhKyHAdllEaL4mvljVOTVtbtklAHUv4DDCv4btDoLqAE1vaH3d06+hjujG0YE7Myul5NYe1tXck8T8M3tkdKSFxUrFSc3DOpYm1JLWeTcSqpwrgLwDdaE8+XDhenDwDsnVs0C6qTRebsyfjkq+NPoPxR+S3NTpCdOZS4l/CBEot/Noo0VHWPHq99yUn1kyI5zYDUQAeJUmtLJLvUyUzGelt8rBX54GmHdAhPHdGvHtdf6o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286613bc-2ccd-40e0-2f4f-08d743c5c9be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2019 03:41:47.0326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ueUkiD+qfrRrIdWhNd9g1f6Dyo1qZYfSeIB1POp2KGMw3XEdEfbkfBfFsXKe0xRP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/91k1oPUnZyXM0PfQ28e/6E93L0T/ExqmVhI1F2JsRQ=;
 b=ejlVu4jlMR824maQ+bE04Yn1hcDPyGzF9iL9ALvQBFNWLKdyS2nklGTTQ0agihC/xDcPW9VAWbbL1ivj2wDZL5EGCC+x6S8bN7kYI0X+pcZbGvbuP041VEJRTBDA6S5tUQl7bARCdXL5CCNtwYl1Q4Qpa6e2/mVvdCrtq+FBavI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEhEUCBmbHVzaCBzdXBwb3J0IGNvZGUgd2FzIG1pc3NpbmcgaW4gdGhlIG5iaW8gYW5kIG52
IGZpbGVzLgoKQ2hhbmdlLUlkOiBJMDQ2ZmY1MjU2NzY3NmI1NmJmMTZkYzE3MjhiMDI0ODEyMzNh
Y2I2MQpTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jIHwgMTYgKysrKysrKysrKysrKy0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICAgICAgfCAgOSArKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3YyXzMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jCmluZGV4IGU3ZTM2ZmI2MTEzZC4uYzY5OWNi
ZmUwMTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3YyXzMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3YyXzMuYwpAQCAtMjcsMTEg
KzI3LDIxIEBACiAjaW5jbHVkZSAibmJpby9uYmlvXzJfM19kZWZhdWx0LmgiCiAjaW5jbHVkZSAi
bmJpby9uYmlvXzJfM19vZmZzZXQuaCIKICNpbmNsdWRlICJuYmlvL25iaW9fMl8zX3NoX21hc2su
aCIKKyNpbmNsdWRlIDx1YXBpL2xpbnV4L2tmZF9pb2N0bC5oPgogCiAjZGVmaW5lIHNtblBDSUVf
Q09ORklHX0NOVEwJMHgxMTE4MDA0NAogI2RlZmluZSBzbW5DUE1fQ09OVFJPTAkJMHgxMTE4MDQ2
MAogI2RlZmluZSBzbW5QQ0lFX0NOVEwyCQkweDExMTgwMDcwCiAKKworc3RhdGljIHZvaWQgbmJp
b192Ml8zX3JlbWFwX2hkcF9yZWdpc3RlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7
CisJV1JFRzMyX1NPQzE1KE5CSU8sIDAsIG1tUkVNQVBfSERQX01FTV9GTFVTSF9DTlRMLAorCQlh
ZGV2LT5ybW1pb19yZW1hcC5yZWdfb2Zmc2V0ICsgS0ZEX01NSU9fUkVNQVBfSERQX01FTV9GTFVT
SF9DTlRMKTsKKwlXUkVHMzJfU09DMTUoTkJJTywgMCwgbW1SRU1BUF9IRFBfUkVHX0ZMVVNIX0NO
VEwsCisJCWFkZXYtPnJtbWlvX3JlbWFwLnJlZ19vZmZzZXQgKyBLRkRfTU1JT19SRU1BUF9IRFBf
UkVHX0ZMVVNIX0NOVEwpOworfQorCiBzdGF0aWMgdTMyIG5iaW9fdjJfM19nZXRfcmV2X2lkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXUzMiB0bXAgPSBSUkVHMzJfU09DMTUoTkJJ
TywgMCwgbW1SQ0NfREVWMF9FUEYwX1NUUkFQMCk7CkBAIC01NiwxMCArNjYsOSBAQCBzdGF0aWMg
dm9pZCBuYmlvX3YyXzNfaGRwX2ZsdXNoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJ
CXN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIHsKIAlpZiAoIXJpbmcgfHwgIXJpbmctPmZ1bmNz
LT5lbWl0X3dyZWcpCi0JCVdSRUczMl9TT0MxNV9OT19LSVEoTkJJTywgMCwgbW1CSUZfQlhfUEZf
SERQX01FTV9DT0hFUkVOQ1lfRkxVU0hfQ05UTCwgMCk7CisJCVdSRUczMl9OT19LSVEoKGFkZXYt
PnJtbWlvX3JlbWFwLnJlZ19vZmZzZXQgKyBLRkRfTU1JT19SRU1BUF9IRFBfTUVNX0ZMVVNIX0NO
VEwpID4+IDIsIDApOwogCWVsc2UKLQkJYW1kZ3B1X3JpbmdfZW1pdF93cmVnKHJpbmcsIFNPQzE1
X1JFR19PRkZTRVQoCi0JCQlOQklPLCAwLCBtbUJJRl9CWF9QRl9IRFBfTUVNX0NPSEVSRU5DWV9G
TFVTSF9DTlRMKSwgMCk7CisJCWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCAoYWRldi0+cm1t
aW9fcmVtYXAucmVnX29mZnNldCArIEtGRF9NTUlPX1JFTUFQX0hEUF9NRU1fRkxVU0hfQ05UTCkg
Pj4gMiwgMCk7CiB9CiAKIHN0YXRpYyB1MzIgbmJpb192Ml8zX2dldF9tZW1zaXplKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQpAQCAtMzMwLDQgKzMzOSw1IEBAIGNvbnN0IHN0cnVjdCBhbWRn
cHVfbmJpb19mdW5jcyBuYmlvX3YyXzNfZnVuY3MgPSB7CiAJLmloX2NvbnRyb2wgPSBuYmlvX3Yy
XzNfaWhfY29udHJvbCwKIAkuaW5pdF9yZWdpc3RlcnMgPSBuYmlvX3YyXzNfaW5pdF9yZWdpc3Rl
cnMsCiAJLmRldGVjdF9od192aXJ0ID0gbmJpb192Ml8zX2RldGVjdF9od192aXJ0LAorCS5yZW1h
cF9oZHBfcmVnaXN0ZXJzID0gbmJpb192N180X3JlbWFwX2hkcF9yZWdpc3RlcnMsCiB9OwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L252LmMKaW5kZXggYjNlNzc1NmZjYzRiLi42Njk5YTQ1Yjg4ZWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtNTg3LDggKzU4NywxMSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9hc2ljX2Z1bmNzIG52X2FzaWNfZnVuY3MgPQogCiBzdGF0aWMgaW50IG52X2Nv
bW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKKyNkZWZpbmUgTU1JT19SRUdfSE9MRV9P
RkZTRVQgKDB4ODAwMDAgLSBQQUdFX1NJWkUpCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKKwlhZGV2LT5ybW1pb19yZW1hcC5y
ZWdfb2Zmc2V0ID0gTU1JT19SRUdfSE9MRV9PRkZTRVQ7CisJYWRldi0+cm1taW9fcmVtYXAuYnVz
X2FkZHIgPSBhZGV2LT5ybW1pb19iYXNlICsgTU1JT19SRUdfSE9MRV9PRkZTRVQ7CiAJYWRldi0+
c21jX3JyZWcgPSBOVUxMOwogCWFkZXYtPnNtY193cmVnID0gTlVMTDsKIAlhZGV2LT5wY2llX3Jy
ZWcgPSAmbnZfcGNpZV9ycmVnOwpAQCAtNzE0LDYgKzcxNywxMiBAQCBzdGF0aWMgaW50IG52X2Nv
bW1vbl9od19pbml0KHZvaWQgKmhhbmRsZSkKIAludl9wcm9ncmFtX2FzcG0oYWRldik7CiAJLyog
c2V0dXAgbmJpbyByZWdpc3RlcnMgKi8KIAlhZGV2LT5uYmlvLmZ1bmNzLT5pbml0X3JlZ2lzdGVy
cyhhZGV2KTsKKwkvKiByZW1hcCBIRFAgcmVnaXN0ZXJzIHRvIGEgaG9sZSBpbiBtbWlvIHNwYWNl
LAorCSAqIGZvciB0aGUgcHVycG9zZSBvZiBleHBvc2UgdGhvc2UgcmVnaXN0ZXJzCisJICogdG8g
cHJvY2VzcyBzcGFjZQorCSAqLworCWlmIChhZGV2LT5uYmlvLmZ1bmNzLT5yZW1hcF9oZHBfcmVn
aXN0ZXJzKQorCQlhZGV2LT5uYmlvLmZ1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKGFkZXYpOwog
CS8qIGVuYWJsZSB0aGUgZG9vcmJlbGwgYXBlcnR1cmUgKi8KIAludl9lbmFibGVfZG9vcmJlbGxf
YXBlcnR1cmUoYWRldiwgdHJ1ZSk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
