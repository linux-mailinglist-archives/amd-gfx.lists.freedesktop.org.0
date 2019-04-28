Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15471B5A4
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5C89274;
	Sun, 28 Apr 2019 07:44:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178E891B8
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:17 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:16 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:16 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/27] drm/amdkfd: Delete alloc_format field from map_queue
 struct
Thread-Topic: [PATCH 18/27] drm/amdkfd: Delete alloc_format field from
 map_queue struct
Thread-Index: AQHU/ZYuk8CO9j1Kk0yMokGL21o8XA==
Date: Sun, 28 Apr 2019 07:44:16 +0000
Message-ID: <20190428074331.30107-19-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ecf9a63-8601-4ce8-e84b-08d6cbad5075
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB29338C75882EFA8EEB8305A792380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9cLQWEAXngwEoRKwX1WjwQj9IKiyr9FPXcyyFYwP3jpn8sCI9zBwisS933KQRFm5eiPc6SIExwe/22Md2f1DxPuf0vAXtx7i+QXin4g1V+Ovw7i/8efV4qpCdvlHUgk7TzyypVL8jta8oGz2PdG2dbLxts/V83IHwWbY1nVwUNJFSKDVCQhF1HhfC4pcaSR2jKV/crlqDrc35+F1XkaWZYU0wQE09jXttpSPi8AYtGZsHIGZPEdZ9ve/Cx1tVB/+mGVQO9IZmwAseixKFhYtV4vizAb8uV9MgyLpOtblLvIwB2jKUHss13NWo/A9zjXBi5ClvGn8wzlVQ5hDqQ9c06YUb77BJDw9phJn3cWOkiSuit0Own3H9y+4T2Dpn0yphJLjpf+x/MSQOIFc5dGRsc2X0ikrS++v0pSIoqjsBdA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecf9a63-8601-4ce8-e84b-08d6cbad5075
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:16.1710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4f1XeJPmGlUZTdo25qHfJU0ROoM/VPvSKodrL/Oo/Q=;
 b=3aGpnTnLp8WcSdsE2Kk+wsaGaecl/KBO/b8h6+Opo6j0v1vUwDSOEXnPYwd5BrHub37lkwWp3W9BHX2aF8gAMFRgnESPCqpsucmmJ+KRixMQFmJ2wY4XctNj/A5zbNUL69yDg64RaXUN9q7ZHlsg3WUtXNXzJ4YW73VjH+gamWQ=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQoNCkFsbG9jIGZvcm1hdCB3YXMgbmV2
ZXIgcmVhbGx5IHN1cHBvcnRlZCBieSBNRUMgRlcuIEZXIGFsd2F5cw0KZG9lcyBvbmUgcGVyIHBp
cGUgYWxsb2NhdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5j
b20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYyB8
IDIgLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3ZpLmMg
fCAyIC0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgg
IHwgNyArLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJz
X3ZpLmggIHwgNyArLS0tLS0tDQogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2tlcm5lbF9xdWV1ZV92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tl
cm5lbF9xdWV1ZV92OS5jDQppbmRleCA2MDQ1NzBiZWE2YmQuLjNkZDczMWM2OWI1ZCAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92OS5jDQpA
QCAtMTUzLDggKzE1Myw2IEBAIHN0YXRpYyBpbnQgcG1fbWFwX3F1ZXVlc192OShzdHJ1Y3QgcGFj
a2V0X21hbmFnZXIgKnBtLCB1aW50MzJfdCAqYnVmZmVyLA0KIA0KIAlwYWNrZXQtPmhlYWRlci51
MzJBbGwgPSBwbV9idWlsZF9wbTRfaGVhZGVyKElUX01BUF9RVUVVRVMsDQogCQkJCQlzaXplb2Yo
c3RydWN0IHBtNF9tZXNfbWFwX3F1ZXVlcykpOw0KLQlwYWNrZXQtPmJpdGZpZWxkczIuYWxsb2Nf
Zm9ybWF0ID0NCi0JCWFsbG9jX2Zvcm1hdF9fbWVzX21hcF9xdWV1ZXNfX29uZV9wZXJfcGlwZV92
aTsNCiAJcGFja2V0LT5iaXRmaWVsZHMyLm51bV9xdWV1ZXMgPSAxOw0KIAlwYWNrZXQtPmJpdGZp
ZWxkczIucXVldWVfc2VsID0NCiAJCXF1ZXVlX3NlbF9fbWVzX21hcF9xdWV1ZXNfX21hcF90b19o
d3NfZGV0ZXJtaW5lZF9xdWV1ZV9zbG90c192aTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3ZpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3ZpLmMNCmluZGV4IDNjZGIxOTgyNjkyNy4uMmFkYWY0
MDAyN2ViIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5l
bF9xdWV1ZV92aS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVs
X3F1ZXVlX3ZpLmMNCkBAIC0xOTAsOCArMTkwLDYgQEAgc3RhdGljIGludCBwbV9tYXBfcXVldWVz
X3ZpKHN0cnVjdCBwYWNrZXRfbWFuYWdlciAqcG0sIHVpbnQzMl90ICpidWZmZXIsDQogDQogCXBh
Y2tldC0+aGVhZGVyLnUzMkFsbCA9IHBtX2J1aWxkX3BtNF9oZWFkZXIoSVRfTUFQX1FVRVVFUywN
CiAJCQkJCXNpemVvZihzdHJ1Y3QgcG00X21lc19tYXBfcXVldWVzKSk7DQotCXBhY2tldC0+Yml0
ZmllbGRzMi5hbGxvY19mb3JtYXQgPQ0KLQkJYWxsb2NfZm9ybWF0X19tZXNfbWFwX3F1ZXVlc19f
b25lX3Blcl9waXBlX3ZpOw0KIAlwYWNrZXQtPmJpdGZpZWxkczIubnVtX3F1ZXVlcyA9IDE7DQog
CXBhY2tldC0+Yml0ZmllbGRzMi5xdWV1ZV9zZWwgPQ0KIAkJcXVldWVfc2VsX19tZXNfbWFwX3F1
ZXVlc19fbWFwX3RvX2h3c19kZXRlcm1pbmVkX3F1ZXVlX3Nsb3RzX3ZpOw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgNCmluZGV4IGYyYmNmNWMw
OTJlYS4uMDY2MTMzOTA3MWYwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wbTRfaGVhZGVyc19haS5oDQpAQCAtMjU1LDExICsyNTUsNiBAQCBlbnVtIG1lc19tYXBf
cXVldWVzX3F1ZXVlX3R5cGVfZW51bSB7DQogcXVldWVfdHlwZV9fbWVzX21hcF9xdWV1ZXNfX2xv
d19sYXRlbmN5X3N0YXRpY19xdWV1ZV92aSA9IDMNCiB9Ow0KIA0KLWVudW0gbWVzX21hcF9xdWV1
ZXNfYWxsb2NfZm9ybWF0X2VudW0gew0KLQlhbGxvY19mb3JtYXRfX21lc19tYXBfcXVldWVzX19v
bmVfcGVyX3BpcGVfdmkgPSAwLA0KLWFsbG9jX2Zvcm1hdF9fbWVzX21hcF9xdWV1ZXNfX2FsbF9v
bl9vbmVfcGlwZV92aSA9IDENCi19Ow0KLQ0KIGVudW0gbWVzX21hcF9xdWV1ZXNfZW5naW5lX3Nl
bF9lbnVtIHsNCiAJZW5naW5lX3NlbF9fbWVzX21hcF9xdWV1ZXNfX2NvbXB1dGVfdmkgPSAwLA0K
IAllbmdpbmVfc2VsX19tZXNfbWFwX3F1ZXVlc19fc2RtYTBfdmkgPSAyLA0KQEAgLTI3OSw3ICsy
NzQsNyBAQCBzdHJ1Y3QgcG00X21lc19tYXBfcXVldWVzIHsNCiAJCQllbnVtIG1lc19tYXBfcXVl
dWVzX3F1ZXVlX3NlbF9lbnVtIHF1ZXVlX3NlbDoyOw0KIAkJCXVpbnQzMl90IHJlc2VydmVkMjox
NTsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX3F1ZXVlX3R5cGVfZW51bSBxdWV1ZV90eXBlOjM7
DQotCQkJZW51bSBtZXNfbWFwX3F1ZXVlc19hbGxvY19mb3JtYXRfZW51bSBhbGxvY19mb3JtYXQ6
MjsNCisJCQl1aW50MzJfdCByZXNlcnZlZDM6MjsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX2Vu
Z2luZV9zZWxfZW51bSBlbmdpbmVfc2VsOjM7DQogCQkJdWludDMyX3QgbnVtX3F1ZXVlczozOw0K
IAkJfSBiaXRmaWVsZHMyOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wbTRfaGVhZGVyc192aS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Bt
NF9oZWFkZXJzX3ZpLmgNCmluZGV4IDdjOGQ5YjM1Nzc0OS4uNTQ2NmNmZTFjM2NjIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX3ZpLmgNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc192aS5oDQpAQCAt
MjE2LDExICsyMTYsNiBAQCBlbnVtIG1lc19tYXBfcXVldWVzX3F1ZXVlX3R5cGVfdmlfZW51bSB7
DQogcXVldWVfdHlwZV9fbWVzX21hcF9xdWV1ZXNfX2xvd19sYXRlbmN5X3N0YXRpY19xdWV1ZV92
aSA9IDMNCiB9Ow0KIA0KLWVudW0gbWVzX21hcF9xdWV1ZXNfYWxsb2NfZm9ybWF0X3ZpX2VudW0g
ew0KLQlhbGxvY19mb3JtYXRfX21lc19tYXBfcXVldWVzX19vbmVfcGVyX3BpcGVfdmkgPSAwLA0K
LWFsbG9jX2Zvcm1hdF9fbWVzX21hcF9xdWV1ZXNfX2FsbF9vbl9vbmVfcGlwZV92aSA9IDENCi19
Ow0KLQ0KIGVudW0gbWVzX21hcF9xdWV1ZXNfZW5naW5lX3NlbF92aV9lbnVtIHsNCiAJZW5naW5l
X3NlbF9fbWVzX21hcF9xdWV1ZXNfX2NvbXB1dGVfdmkgPSAwLA0KIAllbmdpbmVfc2VsX19tZXNf
bWFwX3F1ZXVlc19fc2RtYTBfdmkgPSAyLA0KQEAgLTI0MCw3ICsyMzUsNyBAQCBzdHJ1Y3QgcG00
X21lc19tYXBfcXVldWVzIHsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX3F1ZXVlX3NlbF92aV9l
bnVtIHF1ZXVlX3NlbDoyOw0KIAkJCXVpbnQzMl90IHJlc2VydmVkMjoxNTsNCiAJCQllbnVtIG1l
c19tYXBfcXVldWVzX3F1ZXVlX3R5cGVfdmlfZW51bSBxdWV1ZV90eXBlOjM7DQotCQkJZW51bSBt
ZXNfbWFwX3F1ZXVlc19hbGxvY19mb3JtYXRfdmlfZW51bSBhbGxvY19mb3JtYXQ6MjsNCisJCQl1
aW50MzJfdCByZXNlcnZlZDM6MjsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX2VuZ2luZV9zZWxf
dmlfZW51bSBlbmdpbmVfc2VsOjM7DQogCQkJdWludDMyX3QgbnVtX3F1ZXVlczozOw0KIAkJfSBi
aXRmaWVsZHMyOw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
