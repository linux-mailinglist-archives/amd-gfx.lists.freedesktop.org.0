Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C60BE6EF
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 23:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC44739BA;
	Wed, 25 Sep 2019 21:14:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EA2739AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 21:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh1+zK3E6MIX+EB5IhnfhGiYryNzt6ORtazRVZBrwgtsIPGqzRRmGD2/XCRfcu5eIYO5xEPNNkcDCD0GsC/LhLwW4lUmM2w2ptZJdK/tMEW5oV/oXMjvgRi0Qo7dBCBytkHMoFKXswRJaKBsnBMk1KKS2xLByj8mRxyau6+hOnw8Sgu3woNVOeLJSIrqLI2FJjkawaIS+4ztMzVaU9XLIszpuZffRf4BS8AFqcRHdcliwGR5T2hxrcdgeYR/oQOotMt5V3iRUqCpsixqtj73yZCM+5o1X8V4JGRHa+kqlZseuu8bhEZ/7vyw3abmwp+6nQme2/YgtsTlHj4Bba8I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idJ1tvv4V9RmsuPLwwOP9ES+6wh8D3t2g1eP0Mky/no=;
 b=jULJ0PVVXx6DbLF88WVPx+5eIR3ws3JmevjJVxdHuwWOfL7048lslcBTdNEMx6uqoidlajNMqeDhgr/nPXOh3bP6Vg7y6I/sui/QG7bIR1m1vEOHIjI6K9clUX28B/3BmcLR5BEhPHGbKu9UTaW3cbKDcfUmspCjajsHuZ7T820VQoiY5lv9USdW19F8XHp8BUCG2re0kJ2bWfr3mdr6Ck21Ses+7ORfpJ7Hx9KRhRsNIcEi3EHTA1buvdUJ9EpTBSady9IL3H1J3HzXnJQ593/K+uVB2x7niGyIOXT8+1Aex7N5PPc8TGONGSNu+jtclO6OcA/UgMoYZV+9Y/1bIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3145.namprd12.prod.outlook.com (20.178.31.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Wed, 25 Sep 2019 21:14:08 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 21:14:08 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: use navi12 specific family id for navi12 code path
Thread-Topic: [PATCH] drm/amdkfd: use navi12 specific family id for navi12
 code path
Thread-Index: AQHVc+YrdxynlikctUSs9/sajd/ddg==
Date: Wed, 25 Sep 2019 21:14:08 +0000
Message-ID: <1569446041-12694-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-clientproxiedby: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb5993b3-6260-46d2-4e2e-08d741fd4d80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3145; 
x-ms-traffictypediagnostic: DM6PR12MB3145:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3145D4430B525086912F184AF4870@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:221;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(189003)(199004)(478600001)(14454004)(86362001)(2351001)(25786009)(316002)(2501003)(4326008)(66476007)(66556008)(64756008)(66446008)(66946007)(6486002)(6436002)(6512007)(5640700003)(2906002)(8936002)(2616005)(3846002)(6116002)(50226002)(5660300002)(476003)(7736002)(71200400001)(6916009)(71190400001)(52116002)(66066001)(486006)(36756003)(81166006)(81156014)(8676002)(14444005)(26005)(256004)(305945005)(386003)(6506007)(186003)(99286004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3145;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HqRx1AvfmNbxjWJ61kSBRlLMfVQH7vRY4ok4LZDkjCqGB/tbxyo7rkRan6irzEzFrApQIPQ55Xl6BIA/rvkTSVxCd1lUKdsxy49IT7rC6ZWSxoNBgyrKUOUMDGsTzyLNWFv6d8iL5RM09eoql79MIkd7a0Qx4NbTZhSYIMaT53SZylWjTei/LM1ol6fsqoy41Kn4+n83b1etaeDLWRN3+MthB//hhBmICuxoA0P9HVwK8KewqmEu32qml4A4JBGSHPY4VcUXS2Ig4q928B7hWbjEPlZvsObRimmkEy3KE/MNuS/YakpDP0AlqA2BiknXljS/1NQnkVZtjwsAWxHycCxKavH5ZBawVM3mJBO2Ys5f+cXdCU5Y/0FbVEoqbGHGqf6N3PxhF9TJnaHMggOa+16wJdeBLUwEbfNddHl1hZM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5993b3-6260-46d2-4e2e-08d741fd4d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 21:14:08.0729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/CLJX92xmbnue7spPHHZLcYE7TJzKowyenZiNdSUQ2xoTFXMq/JpHfVr+fmBrZIqDzXknWzUc+VdQAkVGqBaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idJ1tvv4V9RmsuPLwwOP9ES+6wh8D3t2g1eP0Mky/no=;
 b=gkIRAnJTkPvChD2GcBnFVTp6Khwp81FqUrXqMedaTAAbnjA9tIeaR7/DbRaQ1u4Gced5w1L04sHcLznDljTsHXXeDPi8IMM9DkiRPe4js1Gfm3q1sp5waxR1N92URwb+ZoOXveLr07M/DZY/eltIB2JJNGgv1z5uxOUL43zfk5c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

S2VlcCB0aGUgc2FtZSB1c2Ugb2YgQ0hJUF9JRHMgZm9yIG5hdmkxMiBpbiBrZmQKCkNoYW5nZS1J
ZDogSTVlNTJiYmMwNThiZTUxZTc5NTUzMTQ3NzMyYTU3MWE2MDQ1MzdiN2MKU2lnbmVkLW9mZi1i
eTogc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NyYXQuYyAgICAgICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jICAgICAgICAgIHwgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMgICAgICAgICB8IDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMgICAgICAg
fCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jICAgICAgICAg
ICAgIHwgMSArCiA3IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCmluZGV4IDFlZjNjMzIuLjBjMzI3
ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYwpAQCAtNjc2LDYgKzY3Niw3
IEBAIHN0YXRpYyBpbnQga2ZkX2ZpbGxfZ3B1X2NhY2hlX2luZm8oc3RydWN0IGtmZF9kZXYgKmtk
ZXYsCiAJCW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUocmVub2lyX2NhY2hlX2luZm8p
OwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJY2Fz
ZSBDSElQX05BVkkxNDoKIAkJcGNhY2hlX2luZm8gPSBuYXZpMTBfY2FjaGVfaW5mbzsKIAkJbnVt
X29mX2NhY2hlX3R5cGVzID0gQVJSQVlfU0laRShuYXZpMTBfY2FjaGVfaW5mbyk7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggMjcwMzg5Yi4uZWRmYmFlNWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTM4OCw3ICszODgsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZpMTBfZGV2aWNlX2luZm8g
PSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZpMTJfZGV2
aWNlX2luZm8gPSB7Ci0JLmFzaWNfZmFtaWx5ID0gQ0hJUF9OQVZJMTAsCisJLmFzaWNfZmFtaWx5
ID0gQ0hJUF9OQVZJMTIsCiAJLmFzaWNfbmFtZSA9ICJuYXZpMTIiLAogCS5tYXhfcGFzaWRfYml0
cyA9IDE2LAogCS5tYXhfbm9fb2ZfaHFkICA9IDI0LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwppbmRleCAzOTlhNjEyLi41
NGYwYzVjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMKQEAgLTE3OTgsNiArMTc5OCw3IEBAIHN0cnVjdCBkZXZpY2Vf
cXVldWVfbWFuYWdlciAqZGV2aWNlX3F1ZXVlX21hbmFnZXJfaW5pdChzdHJ1Y3Qga2ZkX2RldiAq
ZGV2KQogCQlkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0X3Y5KCZkcW0tPmFzaWNfb3BzKTsKIAkJ
YnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTEyOgogCWNhc2UgQ0hJ
UF9OQVZJMTQ6CiAJCWRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfdjEwX25hdmkxMCgmZHFtLT5h
c2ljX29wcyk7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2ZsYXRfbWVtb3J5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxh
dF9tZW1vcnkuYwppbmRleCA0ODE2NjE0Li40NTBjOTkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYwpAQCAtNDA4LDYgKzQwOCw3IEBAIGludCBrZmRf
aW5pdF9hcGVydHVyZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwcm9jZXNzKQogCQkJY2FzZSBDSElQ
X1JFTk9JUjoKIAkJCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJCWNhc2UgQ0hJUF9OQVZJMTA6CisJ
CQljYXNlIENISVBfTkFWSTEyOgogCQkJY2FzZSBDSElQX05BVkkxNDoKIAkJCQlrZmRfaW5pdF9h
cGVydHVyZXNfdjkocGRkLCBpZCk7CiAJCQkJYnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMKaW5kZXggOTkwYWI1NC4uMTFkMjQ0OCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWUuYwpAQCAtMzM1LDYg
KzMzNSw3IEBAIHN0cnVjdCBrZXJuZWxfcXVldWUgKmtlcm5lbF9xdWV1ZV9pbml0KHN0cnVjdCBr
ZmRfZGV2ICpkZXYsCiAJCWtlcm5lbF9xdWV1ZV9pbml0X3Y5KCZrcS0+b3BzX2FzaWNfc3BlY2lm
aWMpOwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJ
Y2FzZSBDSElQX05BVkkxNDoKIAkJa2VybmVsX3F1ZXVlX2luaXRfdjEwKCZrcS0+b3BzX2FzaWNf
c3BlY2lmaWMpOwogCQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3BhY2tldF9tYW5hZ2VyLmMKaW5kZXggYWY2MmJlMC4uODNlZjRiMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMKQEAgLTI0NCw2ICsyNDQs
NyBAQCBpbnQgcG1faW5pdChzdHJ1Y3QgcGFja2V0X21hbmFnZXIgKnBtLCBzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSkKIAkJcG0tPnBtZiA9ICZrZmRfdjlfcG1fZnVuY3M7CiAJCWJy
ZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6CisJY2FzZSBDSElQX05BVkkxMjoKIAljYXNlIENISVBf
TkFWSTE0OgogCQlwbS0+cG1mID0gJmtmZF92MTBfcG1fZnVuY3M7CiAJCWJyZWFrOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYwppbmRleCBmMjE3MGYwLi40NTM4MzJl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYwpAQCAtMTMyMCw2
ICsxMzIwLDcgQEAgaW50IGtmZF90b3BvbG9neV9hZGRfZGV2aWNlKHN0cnVjdCBrZmRfZGV2ICpn
cHUpCiAJY2FzZSBDSElQX1JFTk9JUjoKIAljYXNlIENISVBfQVJDVFVSVVM6CiAJY2FzZSBDSElQ
X05BVkkxMDoKKwljYXNlIENISVBfTkFWSTEyOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWRldi0+
bm9kZV9wcm9wcy5jYXBhYmlsaXR5IHw9ICgoSFNBX0NBUF9ET09SQkVMTF9UWVBFXzJfMCA8PAog
CQkJSFNBX0NBUF9ET09SQkVMTF9UWVBFX1RPVEFMQklUU19TSElGVCkgJgotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
