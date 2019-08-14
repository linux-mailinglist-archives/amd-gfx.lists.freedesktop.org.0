Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177B8D227
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 13:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978206E0DD;
	Wed, 14 Aug 2019 11:30:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77566E0DD
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 11:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiziOn0Vlj643D57ghHRt8USDMmYoF/RJ5xXt20/rYebvuRbW+rvUqinRVgZxvRVVUmbHehhS1VuHUKW24DX+jFPiHPZTFh04SGePYtbr9USGr912Rfy0+ckpqG6yRT5Mnow5c18bo9dOcbtnAKASpgK94M3Lf0VA79uVHgz4HVnmmSMpImvsugut9ddAirlCu3L8orzWCX0CTXiCEC3X64QkKAyOutc3/npSdK8xEoLyqpU2trlFbmaKQeX0PLB+9odtKF8UeBjq2RTHaUCEHTlB6NGiRQ4a233XV0s0oxyuY0LuQu6LyTYRwxjqwr13Igya0OKPsh6MNX5mj/LhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOzIvyCGTlerDTx+Y1Bc/sbcqvzh9nznuxaaf0jjRg8=;
 b=dfkAwap3FecJ5X76bvm01y0Un6L+zSxIW/hsd0tS0/0DdrSfdtVPYhgqXXv/GFxmcOWSqr18zbI9TdrbwVXuKUUblY3EVCeolS06XTkPqQOihpFBjmc3AlOYmAMSxKrd019WOiaSaPv7DrBPR9CEhgoxwj9TSGbvHqF3GQpP/AEGFsouSty2o0yddg1pXWhg+TF+cfEPoAOVCdok3rXWOIcUmXdo+g1+1t7NSQt3ygSWb/iCIkvV9KUYZL1qDzA58+gdqjEd8tOutYI4j3F3XqQ7duHDLX5/9dsFp/zhQad0fi/VC9zi4geP+lxhmR4I6W/4DPDXegeChcE3qJ2PAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3121.namprd12.prod.outlook.com (20.178.210.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 14 Aug 2019 11:29:57 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 11:29:57 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add smu if version for navi12
Thread-Topic: [PATCH] drm/amd/powerplay: add smu if version for navi12
Thread-Index: AQHVUpOZGl1F5AG72k6/lyl5BfYTZA==
Date: Wed, 14 Aug 2019 11:29:56 +0000
Message-ID: <20190814112940.10644-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cbc12c3-ea4b-4c78-6293-08d720aabbd5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3121; 
x-ms-traffictypediagnostic: BN8PR12MB3121:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3121A6CB7C5E6CDA0CFE01DA89AD0@BN8PR12MB3121.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(189003)(199004)(86362001)(6506007)(71200400001)(2501003)(256004)(71190400001)(2906002)(186003)(26005)(54906003)(6916009)(386003)(52116002)(102836004)(486006)(53936002)(316002)(1076003)(6512007)(2616005)(476003)(8936002)(305945005)(7736002)(478600001)(2351001)(99286004)(4326008)(25786009)(6116002)(66066001)(6436002)(66946007)(66476007)(66556008)(64756008)(66446008)(81166006)(81156014)(5660300002)(6486002)(50226002)(14454004)(3846002)(8676002)(5640700003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3121;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HA1uc7tNe8bT8I0hLapFGuQGMJQiTz/YIXhRGYyadzYqZg3Qx5IDL1YFHnMJQeqnQ7bqgmxj1L+ZjNwkpY7CzpnA74u4bkVw1YCNjdHtw8Oz17E18mlwOe+rEzn8+3R9+Zq7tww0QfBb76l+E964vPaT/whL/7HnE6XA30QVPAb71ZbDrUUQCZ8BUg2SmoD9qBnMC1ULRG7b9gt38R+Y31ri4cf95E9Cl1HncXLJ79EDYiLu8UpV/joHrZqQD8V6Mjyc1neZ02mzWmUlpDX3r3hgqyR27QTXTcM7ZqkX8EkVLv3LX8OVK7dDikoSkV2gyzt1VMkZCaaDyfhpBlusbaSj+VTLk/Oq/vPqnWuDb1kQmor0n7xUAG3xw8AdD15nyNEhwniCtWJr7F7h5X4K5Sx3gxgWPh7IRx+cQtSDRw8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbc12c3-ea4b-4c78-6293-08d720aabbd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 11:29:56.8704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEyaAoy3/ZwY3Ww734enSWDxa1krq07mE4TiBC6DSlOiOd8p1eDx08/q6thDf4Ba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOzIvyCGTlerDTx+Y1Bc/sbcqvzh9nznuxaaf0jjRg8=;
 b=IucqxAEZCflTqhJwAVmd9ZuplyVbfol5dmPgr6dcnIhs5jt88phnfAdXE225UEwQXBPQIDS1niOcP1A6Bf/S6bTfD8AwL3hduHI62u5NUk1pT22Y8jMMczfwhDVyhPSE1du1kTSL1fArzxKfVKvlQbPCDMVJMwE3Nkr85MtX8xY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Wang, 
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggfCAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jICAgICB8IDMgKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9zbXVfdjExXzAuaAppbmRleCA5NzYwNWU5NjNjMmIuLmViMDRkMDY3NTdkMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjgs
NiArMjgsNyBAQAogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9JTlYgMHhGRkZGRkZG
RgogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9WRzIwIDB4MTMKICNkZWZpbmUgU01V
MTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMCAweDMzCisjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9W
RVJTSU9OX05WMTIgMHgzMwogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjE0IDB4
MzMKIAogLyogTVAgQXBlcnR1cmVzICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jCmluZGV4IDkxZGZhZTFhMmIxNi4uMWU3NjZhOGE4NDQ3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMjc4LDYgKzI3OCw5IEBAIHN0YXRp
YyBpbnQgc211X3YxMV8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
CiAJY2FzZSBDSElQX05BVkkxMDoKIAkJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZF
Ul9JRl9WRVJTSU9OX05WMTA7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTI6CisJCXNtdS0+
c21jX2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjEyOworCQlicmVhazsK
IAljYXNlIENISVBfTkFWSTE0OgogCQlzbXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTFfRFJJVkVS
X0lGX1ZFUlNJT05fTlYxNDsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
