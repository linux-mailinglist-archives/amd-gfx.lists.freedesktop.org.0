Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0399D9C4
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 01:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B804D6E330;
	Mon, 26 Aug 2019 23:07:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EA989819
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 23:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1v96k7TmhclZlUmatQRoAQ4hyPMSDdV9fRMy5+c1T71PbvR3RFbN6os/WAhlfPVqSSYmA1GBB+Y58mxEShwnA/Ao+B5MghMXPl2OWV2Xy/RuzL1a4hyzi9hhscadD1pouRfNLFZfQ3NcQTpCll2nS8eUFwiT9qVdfnqty8oVcMXOzV2DScuU881waj2FFQHvFStG9kibjiDomWuckJrTv/aPVVmimGGwEaRkcnjrFEQeHPiWmwfk5qB1WFHsoiFvsrOg7oGXAHBZlGFLhgX6Va8xJRZahHxLpLPpO8iZIYidteRuSjDZjAMNoPepA7rjYAMeZI/uuXD7u9zcS5HDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glM2PpD11hfjkOrdONj27+cJr3iu1WUK36DHnEZpeQM=;
 b=WYyI8LirPEb3FU3xOtFkQaRpbdrC3XVUCSWqQiIZks0FWDjnOBlVfEDhZ6CZNGhni2tVwqei7pO+ZN+mBsYKn2LT3Ibj5sIsAuCM2GC+awBFsEjNncrTzs6coP7Euce7naWxhlhw66s2WQWxJ6OlACTakPJlJjyk60CCXLjmUX3/hDTBUmXyqkjHQNsvJUJvG9u84XWvM34H/4Z7HQCFq/FwJYTbIz00EXrr6OFM/KiMpdWOZbtKQ83eEKRnDNIZoPZxUJf53OgeLuuc4x3H0PzU6tY9hm6C98U7bEP46lKgQsIqmR3N8AEpqA51SFkS4DUm9ny+Lf72DVVa7yA5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3419.namprd12.prod.outlook.com (20.178.198.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 23:07:13 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 23:07:13 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v2)
Thread-Topic: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v2)
Thread-Index: AQHVXGL/+OGpqjSj+UKVx1SHZcYjcg==
Date: Mon, 26 Aug 2019 23:07:13 +0000
Message-ID: <20190826230355.25007-3-Felix.Kuehling@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04e422cb-2660-44c5-9d48-08d72a7a213a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3419; 
x-ms-traffictypediagnostic: DM6PR12MB3419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3419985664F2CC91149FB69992A10@DM6PR12MB3419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(7736002)(305945005)(8676002)(6512007)(8936002)(81166006)(99286004)(76176011)(6506007)(386003)(1076003)(50226002)(316002)(102836004)(66476007)(6486002)(81156014)(6436002)(478600001)(2906002)(5660300002)(14454004)(5640700003)(4326008)(36756003)(71200400001)(256004)(14444005)(71190400001)(54906003)(25786009)(3846002)(6116002)(66446008)(64756008)(53936002)(2501003)(66066001)(66946007)(486006)(86362001)(66556008)(11346002)(186003)(2351001)(446003)(6916009)(26005)(52116002)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3419;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gcDFe6cxlVrGgyeXn4YbMSLV/LQxcFFezikk8grimmzH4TTeK4tXRDqq5ORxx6pS7ESAxiu2dcVr9S18mtRRoDoZbyx2rfJ6iM2ra4XPyxTpHYXHet38tJATi+ExqLy8kk1JmMWuc1nObLSpl8xxeetb2VEa2kVMTkq63qt/oxSwaEvfL6o4oEI11VYbHTq4Qf6m7SpOywGi7GReAYWP+LaAwIARzb03GZZ0flBP9L1K6WdKkKfjY03zNyiMR5iUoyJ8m1pAVoVTb21X7jX9p5p2z1dleSDXz0qCaaYOEdYdvt1+PmMhw6zlRTHmNMwEQgZPCIw5XJXBSg09xm05KFzazw3ovjmluoJ0mHrq4qSQ5rqUJDJX/kBS3NJ9hw+o+vQ/w9Bk9iejnRRpK9wO/BMo9SkquMebPOG5MLZFGyY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e422cb-2660-44c5-9d48-08d72a7a213a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 23:07:13.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTPeqXXKqHGP0rYxUruGrKT5zxqNITzR0MWKtM36RsxzHJa7mSquxIDGcLTMgz75ZjGOmPmU/2LtIh6srZAMGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glM2PpD11hfjkOrdONj27+cJr3iu1WUK36DHnEZpeQM=;
 b=wSS0b7CgQzfSZKq9n/DNBeevoiVIFX4ErgpQ8LKC67HgQXJM1g5nhuhKU4M8Yc3usFeMOPRzRuozZFuEvuh7Gd0PD4LYFFPKBjkuVRCgX4+clyucqEaiUfLdx4ClV8HYAg6dO74f/nGYsA9Gm3IDakgcrLA7R9ssoQvNO/pcqY4=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNhbWUgQk8gY2FuIGJlIG1hcHBlZCB3aXRoIGRpZmZlcmVudCBQVEUgZmxhZ3MgYnkgZGlm
ZmVyZW50IEdQVXMuClRoZXJlZm9yZSBkZXRlcm1pbmUgdGhlIFBURSBmbGFncyBzZXBhcmF0ZWx5
IGZvciBlYWNoIG1hcHBpbmcgaW5zdGVhZApvZiBzdG9yaW5nIHRoZW0gaW4gdGhlIEtGRCBidWZm
ZXIgb2JqZWN0LgoKQWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGRldGVybWluZSB0aGUgUFRFIGZs
YWdzIHRvIGJlIGV4dGVuZGVkIHdpdGgKQVNJQyBhbmQgbWVtb3J5LXR5cGUtc3BlY2lmaWMgbG9n
aWMgaW4gc3Vic2VxdWVudCBjb21taXRzLgoKdjI6IFNwbGl0IEFyY3R1cnVzLXNwZWNpZmljIE1U
WVBFIGNoYW5nZXMgaW50byBzZXBhcmF0ZSBjb21taXQKClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAzOSArKysrKysrKysrKy0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAppbmRleCBlNTE5ZGYzZmQyYjYuLjFhZjhm
ODNmN2UwMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaApA
QCAtNTcsNyArNTcsNyBAQCBzdHJ1Y3Qga2dkX21lbSB7CiAJdW5zaWduZWQgaW50IG1hcHBlZF90
b19ncHVfbWVtb3J5OwogCXVpbnQ2NF90IHZhOwogCi0JdWludDMyX3QgbWFwcGluZ19mbGFnczsK
Kwl1aW50MzJfdCBhbGxvY19mbGFnczsKIAogCWF0b21pY190IGludmFsaWQ7CiAJc3RydWN0IGFt
ZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCA0NGE1MmIwOWNjNTguLjFiNzM0
MGExOGY2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYwpAQCAtMzU1LDYgKzM1NSwyMyBAQCBzdGF0aWMgaW50IHZtX3VwZGF0ZV9wZHMo
c3RydWN0IGFtZGdwdV92bSAqdm0sIHN0cnVjdCBhbWRncHVfc3luYyAqc3luYykKIAlyZXR1cm4g
YW1kZ3B1X3N5bmNfZmVuY2UoTlVMTCwgc3luYywgdm0tPmxhc3RfdXBkYXRlLCBmYWxzZSk7CiB9
CiAKK3N0YXRpYyB1aW50MzJfdCBnZXRfcHRlX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtKQoreworCWJvb2wgY29oZXJlbnQgPSBtZW0tPmFsbG9j
X2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0NPSEVSRU5UOworCXVpbnQzMl90IG1hcHBpbmdfZmxh
Z3M7CisKKwltYXBwaW5nX2ZsYWdzID0gQU1ER1BVX1ZNX1BBR0VfUkVBREFCTEU7CisJaWYgKG1l
bS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfV1JJVEFCTEUpCisJCW1hcHBpbmdfZmxh
Z3MgfD0gQU1ER1BVX1ZNX1BBR0VfV1JJVEVBQkxFOworCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYg
QUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUpCisJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZN
X1BBR0VfRVhFQ1VUQUJMRTsKKworCW1hcHBpbmdfZmxhZ3MgfD0gY29oZXJlbnQgPworCQlBTURH
UFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZUEVfTkM7CisKKwlyZXR1cm4gYW1kZ3B1X2dt
Y19nZXRfcHRlX2ZsYWdzKGFkZXYsIG1hcHBpbmdfZmxhZ3MpOworfQorCiAvKiBhZGRfYm9fdG9f
dm0gLSBBZGQgYSBCTyB0byBhIFZNCiAgKgogICogRXZlcnl0aGluZyB0aGF0IG5lZWRzIHRvIGJv
IGRvbmUgb25seSBvbmNlIHdoZW4gYSBCTyBpcyBmaXJzdCBhZGRlZApAQCAtNDAzLDggKzQyMCw3
IEBAIHN0YXRpYyBpbnQgYWRkX2JvX3RvX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3Qga2dkX21lbSAqbWVtLAogCX0KIAogCWJvX3ZhX2VudHJ5LT52YSA9IHZhOwotCWJvX3Zh
X2VudHJ5LT5wdGVfZmxhZ3MgPSBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3MoYWRldiwKLQkJCQkJ
CQkgbWVtLT5tYXBwaW5nX2ZsYWdzKTsKKwlib192YV9lbnRyeS0+cHRlX2ZsYWdzID0gZ2V0X3B0
ZV9mbGFncyhhZGV2LCBtZW0pOwogCWJvX3ZhX2VudHJ5LT5rZ2RfZGV2ID0gKHZvaWQgKilhZGV2
OwogCWxpc3RfYWRkKCZib192YV9lbnRyeS0+Ym9fbGlzdCwgbGlzdF9ib192YSk7CiAKQEAgLTEw
ODEsNyArMTA5Nyw2IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9n
cHUoCiAJaW50IGJ5dGVfYWxpZ247CiAJdTMyIGRvbWFpbiwgYWxsb2NfZG9tYWluOwogCXU2NCBh
bGxvY19mbGFnczsKLQl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzOwogCWludCByZXQ7CiAKIAkvKgpA
QCAtMTE0MywxNiArMTE1OCw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9y
eV9vZl9ncHUoCiAJCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBTSkgPwogCQkJVklfQk9f
U0laRV9BTElHTiA6IDE7CiAKLQltYXBwaW5nX2ZsYWdzID0gQU1ER1BVX1ZNX1BBR0VfUkVBREFC
TEU7Ci0JaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFKQotCQltYXBwaW5nX2Zs
YWdzIHw9IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRTsKLQlpZiAoZmxhZ3MgJiBBTExPQ19NRU1f
RkxBR1NfRVhFQ1VUQUJMRSkKLQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9FWEVD
VVRBQkxFOwotCWlmIChmbGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVCkKLQkJbWFwcGlu
Z19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfVUM7Ci0JZWxzZQotCQltYXBwaW5nX2ZsYWdzIHw9
IEFNREdQVV9WTV9NVFlQRV9OQzsKLQkoKm1lbSktPm1hcHBpbmdfZmxhZ3MgPSBtYXBwaW5nX2Zs
YWdzOworCSgqbWVtKS0+YWxsb2NfZmxhZ3MgPSBmbGFnczsKIAogCWFtZGdwdV9zeW5jX2NyZWF0
ZSgmKCptZW0pLT5zeW5jKTsKIApAQCAtMTYyNSw5ICsxNjMxLDEwIEBAIGludCBhbWRncHVfYW1k
a2ZkX2dwdXZtX2ltcG9ydF9kbWFidWYoc3RydWN0IGtnZF9kZXYgKmtnZCwKIAogCUlOSVRfTElT
VF9IRUFEKCYoKm1lbSktPmJvX3ZhX2xpc3QpOwogCW11dGV4X2luaXQoJigqbWVtKS0+bG9jayk7
Ci0JKCptZW0pLT5tYXBwaW5nX2ZsYWdzID0KLQkJQU1ER1BVX1ZNX1BBR0VfUkVBREFCTEUgfCBB
TURHUFVfVk1fUEFHRV9XUklURUFCTEUgfAotCQlBTURHUFVfVk1fUEFHRV9FWEVDVVRBQkxFIHwg
QU1ER1BVX1ZNX01UWVBFX05DOworCSgqbWVtKS0+YWxsb2NfZmxhZ3MgPQorCQkoKGJvLT5wcmVm
ZXJyZWRfZG9tYWlucyAmIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pID8KKwkJIEFMTE9DX01FTV9G
TEFHU19WUkFNIDogQUxMT0NfTUVNX0ZMQUdTX0dUVCkgfAorCQlBTExPQ19NRU1fRkxBR1NfV1JJ
VEFCTEUgfCBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRTsKIAogCSgqbWVtKS0+Ym8gPSBhbWRn
cHVfYm9fcmVmKGJvKTsKIAkoKm1lbSktPnZhID0gdmE7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
