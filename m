Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDAA4CD8
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 02:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0D389A35;
	Mon,  2 Sep 2019 00:37:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944B89A35
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 00:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icar/RGRipz8afPqLhxFbbAQnaSEYXf6B8iJvIa3tZxunD1CUW2g3V47WUvmo8kEdO4gg4alufDcGao1au2IlrlhsesW0BykVGLLiudC7mK1wS4XeyZc0SNVL856vB9p/XoXEggjHjLpawVluEtIgLxqxa9egDI86ZtWAXnhyDXAOUi1neLmQne7bwSfwxpdqcwW5a47T+ZQ4q/8XrYfnPBGWHejtdHU2KICRUtqAHz/AekjHhQxdiCX4/c8tuS4wu8Ilojvw3/qnu8c29wCLZQwzBMzHCS3EoaEbSLCUe0w534HReIaP/JsYEQVrTaobMry1idMT69VML8LzKc9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tkM1KQH7KHVYyJ/TGSa6YtUrn1CXNDsZD6YAmXM6aE=;
 b=hbCriddOb1yRDo3QASmdvYcCApKgb/rcammkMuz9+rTiHNBc546VJSivdueADeIfpwpyMPfYB09Z2gkWq1zGlZFc3BKhsxdmNbvA3ObL7FSbCAXkfrKg4chJZUdx2Ag6+V9oSAbx9BExTiQRDK/tL21jdNGAJandIJJwEtwV3iVtFJTfauSqtsLGqpyqaZfElUxKxGxvtSS+c0L4uwAE985+vy5sUCrQ/rxDZaIkRbLAJnLGXvyqrSoEXfSwAWRmZbhdKA+BBcaIsjo+F7JXggac+QF3kgZC6qiRP1mpc0eGVmlvuLlxS5ilj8Un8Xitg2AvkFhG3DoZq7kCa2LltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (52.132.141.166) by
 DM5PR12MB1146.namprd12.prod.outlook.com (10.168.236.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 2 Sep 2019 00:37:50 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::7927:e3a8:c4bd:2531]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::7927:e3a8:c4bd:2531%5]) with mapi id 15.20.2220.013; Mon, 2 Sep 2019
 00:37:50 +0000
From: "Gui, Jack" <Jack.Gui@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: guard manual mode prerequisite for
 clock level force
Thread-Topic: [PATCH] drm/amd/powerplay: guard manual mode prerequisite for
 clock level force
Thread-Index: AQHVXxaSbdSw9gixbEeGGXSmhBkQMqcXjsYg
Date: Mon, 2 Sep 2019 00:37:50 +0000
Message-ID: <DM5PR12MB25835E18B95FEB7EC6387F588BBE0@DM5PR12MB2583.namprd12.prod.outlook.com>
References: <20190830093725.32273-1-evan.quan@amd.com>
In-Reply-To: <20190830093725.32273-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4daa15a1-0d13-46db-bd17-08d72f3dc900
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1146; 
x-ms-traffictypediagnostic: DM5PR12MB1146:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1146081490D125677CFBDBCA8BBE0@DM5PR12MB1146.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(199004)(189003)(13464003)(102836004)(2906002)(8676002)(14454004)(186003)(229853002)(76176011)(305945005)(486006)(5660300002)(3846002)(6116002)(99286004)(478600001)(52536014)(25786009)(6436002)(7696005)(7736002)(71200400001)(8936002)(71190400001)(76116006)(66946007)(53546011)(110136005)(74316002)(66066001)(66476007)(66556008)(64756008)(316002)(26005)(66446008)(4326008)(53936002)(54906003)(2501003)(476003)(14444005)(55016002)(446003)(6246003)(33656002)(81156014)(86362001)(11346002)(6506007)(81166006)(256004)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1146;
 H:DM5PR12MB2583.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AhnPgRzah2z884TNCoGC0MEyaxpOaAWVtHviH8rU69T9gX9OGEUgjml/p0zVI1g8ih5iF+tuJFCXSW+AFfYgbPKx+ei88jGt8UVnMYyI7GXMv3XlIINea5byZvWpLeIKnVyX3Obv8RG76IAm+k8R/rCB9LShE6vnBtosGhAM30IrpvP00qJlZKSWK3pfcB1jwFAxPUetIKBHDYD6K+qyyrD9Z0z2pBv4onCqL6mU8inOPgrcrK28+yw4y9EwwPk3C0p1tRvh1hcPQ69RnPwIoLiV7UWmbhNdUbanWc6Ycdiz4R1Wb34eRDBtO9IJYTKOrY46NAs1f5hEnsxtUu5f4+kp8XQCflYyMhmyAhuFuIwXcCqfZh4tK+olVKl89J1+SnKN8VMrsnjKxrbTMxZkPJ3vogP7Ht+qJhO6Pt7t02M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daa15a1-0d13-46db-bd17-08d72f3dc900
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 00:37:50.7124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLZaQpx0qcmovie53d73e8O/fufw/a//VuY/Gasgzev1BDOsTT+A7I3Ew6J8YfCM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tkM1KQH7KHVYyJ/TGSa6YtUrn1CXNDsZD6YAmXM6aE=;
 b=c6HTvjPR4Oxfp3rBo7MeJe+iLaIJRNClZaWSXBvkrR5ZR/PDYwZXjX82zuvt0xhZaxwWvCx21KGkK21mhzZkMBgQAUTAs9ejYQybngVOBL7tDMxB7Kn/BceSbKDgqdhXvdYNiDwg7pAraOFUKEcwPydwDz6yrTcYi/imnNHnwSk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Gui@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEphY2sgR3VpIDxKYWNrLkd1aUBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KRnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4gClNlbnQ6IEZy
aWRheSwgQXVndXN0IDMwLCAyMDE5IDU6MzcgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBMaSwgQ2FuZGljZSA8Q2FuZGljZS5MaUBhbWQuY29tPjsgR3VpLCBKYWNrIDxK
YWNrLkd1aUBhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+ClN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGd1YXJkIG1hbnVhbCBtb2RlIHByZXJlcXVpc2l0
ZSBmb3IgY2xvY2sgbGV2ZWwgZm9yY2UKCkZvcmNlIGNsb2NrIGxldmVsIGlzIGZvciBkcG0gbWFu
dWFsIG1vZGUgb25seS4KCkNoYW5nZS1JZDogSTNiNGNhZjNmYWZjNzIxOTdkNjVlMmI5MjU1YzY4
ZTQwZTY3M2UyNWUKUmVwb3J0ZWQtYnk6IENhbmRpY2UgTGkgPGNhbmRpY2UubGlAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgIHwgMTggKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwg
IDUgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICAg
fCAgNiAtLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXgg
MzE3ZDQxMzMxZjRiLi5kZDZjMTU0N2U1MjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKQEAgLTE3NTgsNiArMTc1OCwyNCBAQCBpbnQgc211X3NldF9kaXNw
bGF5X2NvdW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBjb3VudCkKIAlyZXR1
cm4gcmV0OwogfQogCitpbnQgc211X2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCisJCQkgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCisJCQkgdWludDMyX3QgbWFz
aykKK3sKKwlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBtX2N0eCA9ICYoc211LT5zbXVf
ZHBtKTsKKwlpbnQgcmV0ID0gMDsKKworCWlmIChzbXVfZHBtX2N0eC0+ZHBtX2xldmVsICE9IEFN
RF9EUE1fRk9SQ0VEX0xFVkVMX01BTlVBTCkgeworCQlwcl9kZWJ1ZygiZm9yY2UgY2xvY2sgbGV2
ZWwgaXMgZm9yIGRwbSBtYW51YWwgbW9kZSBvbmx5LlxuIik7CisJCXJldHVybiAtRUlOVkFMOwor
CX0KKworCWlmIChzbXUtPnBwdF9mdW5jcyAmJiBzbXUtPnBwdF9mdW5jcy0+Zm9yY2VfY2xrX2xl
dmVscykKKwkJcmV0ID0gc211LT5wcHRfZnVuY3MtPmZvcmNlX2Nsa19sZXZlbHMoc211LCBjbGtf
dHlwZSwgbWFzayk7CisKKwlyZXR1cm4gcmV0OworfQorCiBjb25zdCBzdHJ1Y3QgYW1kX2lwX2Z1
bmNzIHNtdV9pcF9mdW5jcyA9IHsKIAkubmFtZSA9ICJzbXUiLAogCS5lYXJseV9pbml0ID0gc211
X2Vhcmx5X2luaXQsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaAppbmRleCBlMTE2NWQzMjNlYTkuLmIxOTIyNGNiNmQ2ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC02MzUsOCArNjM1LDYg
QEAgc3RydWN0IHNtdV9mdW5jcwogCSgoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVx
PyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVxKChzbXUpLCAoY2xrX2lkKSwgKHZh
bHVlKSkgOiAwKSAgI2RlZmluZSBzbXVfcHJpbnRfY2xrX2xldmVscyhzbXUsIGNsa190eXBlLCBi
dWYpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+cHJpbnRfY2xrX2xldmVscyA/IChzbXUpLT5wcHRf
ZnVuY3MtPnByaW50X2Nsa19sZXZlbHMoKHNtdSksIChjbGtfdHlwZSksIChidWYpKSA6IDApIC0j
ZGVmaW5lIHNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgY2xrX3R5cGUsIGxldmVsKSBcCi0JKChz
bXUpLT5wcHRfZnVuY3MtPmZvcmNlX2Nsa19sZXZlbHMgPyAoc211KS0+cHB0X2Z1bmNzLT5mb3Jj
ZV9jbGtfbGV2ZWxzKChzbXUpLCAoY2xrX3R5cGUpLCAobGV2ZWwpKSA6IDApCiAjZGVmaW5lIHNt
dV9nZXRfb2RfcGVyY2VudGFnZShzbXUsIHR5cGUpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+Z2V0
X29kX3BlcmNlbnRhZ2UgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfb2RfcGVyY2VudGFnZSgoc211
KSwgKHR5cGUpKSA6IDApICAjZGVmaW5lIHNtdV9zZXRfb2RfcGVyY2VudGFnZShzbXUsIHR5cGUs
IHZhbHVlKSBcIEBAIC04MzMsNSArODMxLDggQEAgY29uc3QgY2hhciAqc211X2dldF9tZXNzYWdl
X25hbWUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X21lc3NhZ2VfdHlwZSAgY29u
c3QgY2hhciAqc211X2dldF9mZWF0dXJlX25hbWUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gc211X2ZlYXR1cmVfbWFzayBmZWF0dXJlKTsgIHNpemVfdCBzbXVfc3lzX2dldF9wcF9mZWF0
dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1Zik7ICBpbnQgc211X3N5
c19zZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50NjRfdCBu
ZXdfbWFzayk7CitpbnQgc211X2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsCisJCQkgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCisJCQkgdWludDMyX3QgbWFzayk7
CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmlu
ZGV4IDg5OWJmOTZiMjNlMS4uNzhkNzdhNjNlMDg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0xMjc0LDE0ICsxMjc0LDggQEAgc3RhdGljIGludCB2
ZWdhMjBfZm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlzdHJ1Y3Qg
dmVnYTIwX2RwbV90YWJsZSAqZHBtX3RhYmxlOwogCXN0cnVjdCB2ZWdhMjBfc2luZ2xlX2RwbV90
YWJsZSAqc2luZ2xlX2RwbV90YWJsZTsKIAl1aW50MzJfdCBzb2Z0X21pbl9sZXZlbCwgc29mdF9t
YXhfbGV2ZWwsIGhhcmRfbWluX2xldmVsOwotCXN0cnVjdCBzbXVfZHBtX2NvbnRleHQgKnNtdV9k
cG0gPSAmc211LT5zbXVfZHBtOwogCWludCByZXQgPSAwOwogCi0JaWYgKHNtdV9kcG0tPmRwbV9s
ZXZlbCAhPSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9NQU5VQUwpIHsKLQkJcHJfaW5mbygiZm9yY2Ug
Y2xvY2sgbGV2ZWwgaXMgZm9yIGRwbSBtYW51YWwgbW9kZSBvbmx5LlxuIik7Ci0JCXJldHVybiAt
RUlOVkFMOwotCX0KLQogCW11dGV4X2xvY2soJihzbXUtPm11dGV4KSk7CiAKIAlzb2Z0X21pbl9s
ZXZlbCA9IG1hc2sgPyAoZmZzKG1hc2spIC0gMSkgOiAwOwotLQoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
