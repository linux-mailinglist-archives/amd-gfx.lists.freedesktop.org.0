Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF84BF951
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1D6EDE2;
	Thu, 26 Sep 2019 18:38:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760072.outbound.protection.outlook.com [40.107.76.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71F26EDDE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxSXnN6WAl51AnuGXZ/WCK8EjpPYLge/+6TTfdZfKS5bGxn3FwtWzyVppc50b6ymMs7LVATZlbKvn6Ry+k31DkIYf4Xgm/c0/w+luqLJxqv4muja1g/XkESkH8ybuDhyxZr9AkytuO294v3ddhyRCV5QbX6lNXbTPWt5ABEwB6JkrDfT/+sDxCm6f4T8+LEqDiXkLnreO8F1IIMzF9JTm/oBNZDjtATaJxmlfr6wv3AXCXZsArzNUe+Y+kzrLdjRvbQwkINyhA9bK/jZ5XEmjgeE96xueX4I8q2LCY4NKVoTTIScXRpEWB3etuAadBqwXm/Cv9Mp2SyIaO5cxnVn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZOLoXbKGcRhGndUY62gyhBLwlSoHsNbF5Ro929hI/M=;
 b=EQ/o+wnOYPjcUTUbV1oW+8EsVYJrrFyHINPuhngTry9NMR6vtclohs9kaxUIXGO2JZPwvNQMgz6pZfhxVsA0brXBh/mKxk4ZTjFHdfbB7P8I1+yHhJGVbn8O2pZkGC/6fUxUCZ7wyOqSoNSpEQrNr7fsyRamfsLJp1ZQDRRrT9wJbLxpiMmvpf8BJSdy35QNTBU2UnRvFKDbOpSI8mHvy5j/nuGsSzPwuRN8SB/DSbePrqV1CbCEIwD03D9GZ1klUsBpuVDkVQfLxtjPeSopDXFBGSbvkinGNzQ1in86R0o9v92AXZhXEpUssR4PlsoBRG1pZ+i1SvBe6hUy+/7CGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 18:38:50 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:38:50 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdkfd: Query vmid pasid mapping through stored info
Thread-Topic: [PATCH 5/6] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Index: AQHVdJmjI5HEhQoKJ0eTOopMs7/p9Q==
Date: Thu, 26 Sep 2019 18:38:50 +0000
Message-ID: <20190926183826.18813-5-Yong.Zhao@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926183826.18813-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c1c7ac0-9b49-4a81-1b0e-08d742b0c623
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB346678636280F2FBA0431F1FF0860@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(11346002)(476003)(6436002)(305945005)(7736002)(50226002)(14454004)(8936002)(81156014)(81166006)(8676002)(256004)(5660300002)(2351001)(6512007)(4326008)(86362001)(316002)(76176011)(2501003)(2906002)(186003)(3846002)(6116002)(99286004)(52116002)(71200400001)(71190400001)(102836004)(25786009)(1076003)(26005)(36756003)(66066001)(6916009)(6506007)(386003)(478600001)(64756008)(66556008)(5640700003)(486006)(66446008)(446003)(66946007)(2616005)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zC6S9KP8WrZq8WDDNd6BHxairtPoMiYjg+A4YAdIczS32Ii9RrNOxP559Plvnb47f3VTz3rtkjeJNG1RMv8Z7UoilVlshhHKtGdDSVqI8oNVUQt0Fdy34ggJMFMHBQJHTJm5Y3bAaJQ9w3Z2l3ahgMaW6QNS17aVVnjc815UCNMR3ffAZgQGCeEumubW7yirtu+K8svoafNie2B8f9aUJSJWcojZ4RwOJ9/lVaNN6bSSwjYlm58ccGYKs/IdQCJJQFUsrv5OxLpni/t2dO6FQZ5f3M/VplW48rnTGMffM86dIQ+1fEUzm6zIWEQHDlX6Ql2ZB/irUYlzIwpNL0ZqnzdC8pM7dLmZ2jW2dOlN+scROZWylzScONrhIFByN7uOoLA+m6ZylEi+YJtEw8xE67VNZ0MwgO56lfe768CXhdE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1c7ac0-9b49-4a81-1b0e-08d742b0c623
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:38:50.4240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2iVT9a2wTciQQgYePNw6oXGhUOfILpivomFGVFSCrDTX3EbI6Tu/AikjbwVVsP5V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZOLoXbKGcRhGndUY62gyhBLwlSoHsNbF5Ro929hI/M=;
 b=3+Mv+LoQobSJ70ozhIQmiiuuenFhq6vnsL5xo/wFAzawzHRdRAi0binU70SvoP0PC/qdWXs9jrIQXj5RWzZM2ypzfCjdtPpjoVPGIZFDZ+Qbpq0q/tquVOKSt+e+PWrlEAQeOJlPkkP//2U8ZxLAkyQB4cGd3FTsgqOT1Z6ZiEo=
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

QmVjYXVzZSB3ZSByZWNvcmQgdGhlIG1hcHBpbmcgaW4gdGhlIHNvZnR3YXJlLCB3ZSBjYW4gcXVl
cnkgcGFzaWQKdGhyb3VnaCB2bWlkIHVzaW5nIHRoZSBzdG9yZWQgbWFwcGluZyBpbnN0ZWFkIG9m
IHJlYWRpbmcgZnJvbSBBVEMKcmVnaXN0ZXJzLgoKVGhpcyBhbHNvIHByZXBhcmVzIGZvciB0aGUg
ZGVmZWF0dXJlZCBBVEMgYmxvY2sgaW4gZnV0dXJlIEFTSUNzLgoKQ2hhbmdlLUlkOiBJNzgxY2I5
ZDMwZGMwY2M5MzM3OTkwOGZmMWNmOGRhNzk4YmIyNmYxMwpTaWduZWQtb2ZmLWJ5OiBZb25nIFpo
YW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMgICAgfCAxMiArKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmggICAgfCAgMyArKysKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jICAgICAgfCAgMyArLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
CmluZGV4IGQwMDZhZGVmZWY1NS4uNTdkMzNlODg3ZjQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwpAQCAtMjIwLDYg
KzIyMCwxOCBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX2Rvb3JiZWxsKHN0cnVjdCBxY21fcHJv
Y2Vzc19kZXZpY2UgKnFwZCwKIAlXQVJOX09OKCFvbGQpOwogfQogCit1aW50MTZfdCBnZXRfcGFz
aWRfZnJvbV92bWlkX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCisJ
CQkJCXVpbnQxNl90IHZtaWQpCit7CisJaW50IGlkeCA9IHZtaWQgLSBkcW0tPmRldi0+dm1faW5m
by5maXJzdF92bWlkX2tmZDsKKworCXVpbnQxNl90IHBhc2lkID0gZHFtLT5kZXYtPmRxbS0+dm1p
ZF9wYXNpZFtpZHhdOworCWlmICghcGFzaWQpCisJCXByX2VycigicGFzaWQgaXMgbm90IHF1ZXJp
ZWQgY29ycmVjdGx5XG4iKTsKKworCXJldHVybiBwYXNpZDsKK30KKwogc3RhdGljIGludCBhbGxv
Y2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLAogCQkJc3RydWN0IHFj
bV9wcm9jZXNzX2RldmljZSAqcXBkLAogCQkJc3RydWN0IHF1ZXVlICpxKQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaAppbmRl
eCA2N2I1ZTVmYWRkOTUuLjllOGY2Y2RlMzk3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgKQEAgLTI0NCw2ICsyNDQs
OSBAQCB2b2lkIHNldF9xdWV1ZV9zbmFwc2hvdF9lbnRyeShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21h
bmFnZXIgKmRxbSwKIAkJCSAgICAgIGludCBmbGFncywKIAkJCSAgICAgIHN0cnVjdCBrZmRfcXVl
dWVfc25hcHNob3RfZW50cnkgKnFzc19lbnRyeSk7CiAKK3VpbnQxNl90IGdldF9wYXNpZF9mcm9t
X3ZtaWRfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwKKwkJCQkJdWlu
dDE2X3Qgdm1pZCk7CisKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdldF9zaF9tZW1fYmFz
ZXNfMzIoc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQogewogCXJldHVybiAocGRkLT5s
ZHNfYmFzZSA+PiAxNikgJiAweEZGOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfaW50X3Byb2Nlc3NfdjkuYwppbmRleCBhYjhhNjk1YzRhM2MuLmFkYjViYmFiNzE2MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMKQEAg
LTU4LDggKzU4LDcgQEAgc3RhdGljIGJvb2wgZXZlbnRfaW50ZXJydXB0X2lzcl92OShzdHJ1Y3Qg
a2ZkX2RldiAqZGV2LAogCQltZW1jcHkocGF0Y2hlZF9paHJlLCBpaF9yaW5nX2VudHJ5LAogCQkJ
CWRldi0+ZGV2aWNlX2luZm8tPmloX3JpbmdfZW50cnlfc2l6ZSk7CiAKLQkJcGFzaWQgPSBkZXYt
PmtmZDJrZ2QtPmdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3Bhc2lkKAotCQkJCWRldi0+a2dk
LCB2bWlkKTsKKwkJcGFzaWQgPSBnZXRfcGFzaWRfZnJvbV92bWlkX25vY3BzY2goZGV2LT5kcW0s
IHZtaWQpOwogCiAJCS8qIFBhdGNoIHRoZSBwYXNpZCBmaWVsZCAqLwogCQlwYXRjaGVkX2locmVb
M10gPSBjcHVfdG9fbGUzMigobGUzMl90b19jcHUocGF0Y2hlZF9paHJlWzNdKQotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
