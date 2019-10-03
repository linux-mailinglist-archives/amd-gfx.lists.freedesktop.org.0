Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC1CA0E6
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 17:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01806EA0D;
	Thu,  3 Oct 2019 15:07:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3106EA0D
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 15:07:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJpGwJYF3X35CBVNO/1ysNNy1DZFbAir+7OxMb3nVktU9R8xHoSTwx2B+WIDJq1nNzFUW0rmqxhmSGPcZXEa4HDDKeb3ERAq1mq7e4hPDWJdKTqsaFd5LXjX7SRwoMqQkyviw94qGcuaAIFbxfP8LYk2hswgr88VD3QPdnkVQ0vTOKDvXxRZ8bYx+PPC54Q+hD4d2/idyglW+wC8CQMGns6QGXkGs0GcmqLBdFQsKvc+Ui8a/W931Gn49lK27BOdOrvzdtN7plVvlSisSgvTi/7r9gARENOD1hI1QFx+Mz+Ivb9P0JtgIvFUEoWUrT7gIao6Vd0j5wDhnXFvXxFPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrQqe8ilPVEQFMveHMe3Oa4zUPqxRUiS7d8zpDyp/1g=;
 b=GexdRrQoa0Kp04b8k+YtOPQZkvubgBPJAzjYYIc5cFHc0FM/Z+PXtRxWTqMDiBFdBaSJPweQwz3h6wEHnM9KGqxhGkbN1L/1Pj4m5PC8v6AZgGKOYtdkvVzz1lJYEgs2/Ml8AYTFCDxF3aNTBOpMp9YztMFwN1Ab5GRAdfo+AYyERQ2Zqe+TkuWkjA9yVnJPcFY5ClRQNypwWZ+8LhMsFxqLWx63J9QNNPsIILy5xhPRwokmA+JwZz+5cBVX8KUVRVnynXVA8Uqwyd0/4v/Hf7+2UiyfRmk5TF4vpmvMkcwNcV3JVdSSJT7MMWzz1T/PaQzB6FBNz54EtYW/1rqcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 3 Oct 2019 15:07:24 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 15:07:24 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: improve MSI-X handling
Thread-Topic: [PATCH 1/2] drm/amdgpu: improve MSI-X handling
Thread-Index: AQHVefTGsO5hVoOxH0SuRu4yw+9Po6dJBIrA
Date: Thu, 3 Oct 2019 15:07:23 +0000
Message-ID: <MN2PR12MB3309565E84BD6930EF857992EC9F0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20191003141326.7600-1-alexander.deucher@amd.com>
In-Reply-To: <20191003141326.7600-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.205.230.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dd5a6e2-30bd-438f-66b7-08d74813658d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB430499913D7ECE4FCE1071F7EC9F0@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:359;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(199004)(189003)(13464003)(81156014)(81166006)(6246003)(966005)(52536014)(53546011)(6506007)(8676002)(8936002)(7736002)(66066001)(4326008)(74316002)(305945005)(14454004)(486006)(5660300002)(71190400001)(71200400001)(2906002)(476003)(110136005)(186003)(26005)(3846002)(2501003)(446003)(11346002)(55016002)(25786009)(86362001)(256004)(6306002)(478600001)(6116002)(316002)(102836004)(66556008)(66476007)(99286004)(76176011)(229853002)(6436002)(33656002)(66446008)(9686003)(66946007)(7696005)(76116006)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: guCpyZETobpy/tzQIxiqc6ZWf+AzLHxi0P0m4Hf5fqFKYggiob40Y1GywQOszc5GDkVnCrtKozHw72EPEcQE1A6YVj+Uooxe16Lz46RNZNQGfwUEyTdnXyOA0Kq4Kn78tafmR7aWKkdPBSekeDUA/k0LDSGFu8sps/UeOLdhDW8QM485McF0NPhgFILlZVj1fRGck+wAE399rsZh15jtlVC6I8D+YIuExzfkC3ALBsEwkbud8xHBLkIVjEC9Fcu3ciPC549h0Tx5QiYsCXW3KJDJSKAu3HwPs0Q75XjdWzs7smIFWYQM7aHxzJfY1dRWjjwqWFHcb/BtrPFwbMyk4IxRKBRIp4AHYpLXVjZPVu7Yo+37pBBox5Mr4bFI0dyqJtzVjGmunU9H94OmaC5rqCBeFNSmWaij3KVw70wu7j/EYWGMter/K4lElWpuKzRFfEkqMPgkcFtueWzKuYFplA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd5a6e2-30bd-438f-66b7-08d74813658d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 15:07:23.9769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jkk6c9dfMFlakaVcijowmdnIaQXVuPLb/RV2YOEbTJozYRhr/RQTaKrIBgylqGbIU1uBj00FeTJSMovSJ29q3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrQqe8ilPVEQFMveHMe3Oa4zUPqxRUiS7d8zpDyp/1g=;
 b=hIOo2hteTiagzvrBeKG0vfOjXTFIgtlLFvcWdNmKlYd1/xD3etRCrgsWmKZgxF8TWtPg8XDNjy71Sx13hPx8rMNgLIYxOANyfMw3w3dfPEpWlFLvqabkG6hF4qVaqLsY8USTs1rrnMR1WlfT4DntZaRqr24lCQ6dv1TN5STIglg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGFyZSBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4IERldWNoZXINClNlbnQ6
IFRodXJzZGF5LCBPY3RvYmVyIDMsIDIwMTkgMTA6MTMgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6IGltcHJvdmUgTVNJLVgg
aGFuZGxpbmcNCg0KQ2hlY2sgdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgdmVjdG9ycyBhbmQgZmFs
bCBiYWNrIHRvIE1TSSBpZiB3ZSByZXR1cm4gb3IgZXJyb3Igb3IgMCBNU0ktWCB2ZWN0b3JzLg0K
DQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgfCAxNCArKysr
KysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ly
cS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jDQppbmRleCA1MDc3
MWIyNzU3ZGMuLjk4YWEyOGVkYmE2YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9pcnEuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2lycS5jDQpAQCAtMjQ1LDExICsyNDUsMTkgQEAgaW50IGFtZGdwdV9pcnFfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJYWRldi0+aXJxLm1zaV9lbmFibGVkID0gZmFsc2U7
DQogDQogCWlmIChhbWRncHVfbXNpX29rKGFkZXYpKSB7DQotCQlpbnQgbnZlYyA9IHBjaV9hbGxv
Y19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAxLCBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+cGRl
diksDQotCQkJCQlQQ0lfSVJRX01TSSB8IFBDSV9JUlFfTVNJWCk7DQorCQl1bnNpZ25lZCBpbnQg
ZmxhZ3M7DQorCQlpbnQgbnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChhZGV2LT5wZGV2KTsNCisN
CisJCWlmIChudmVjIDw9IDApIHsNCisJCQlmbGFncyA9IFBDSV9JUlFfTVNJOw0KKwkJCW52ZWMg
PSAxOw0KKwkJfSBlbHNlIHsNCisJCQlmbGFncyA9IFBDSV9JUlFfTVNJIHwgUENJX0lSUV9NU0lY
Ow0KKwkJfQ0KKwkJbnZlYyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAxLCBu
dmVjLCBmbGFncyk7DQogCQlpZiAobnZlYyA+IDApIHsNCiAJCQlhZGV2LT5pcnEubXNpX2VuYWJs
ZWQgPSB0cnVlOw0KLQkJCWRldl9kYmcoYWRldi0+ZGV2LCAiYW1kZ3B1OiB1c2luZyBNU0kuXG4i
KTsNCisJCQlkZXZfZGJnKGFkZXYtPmRldiwgImFtZGdwdTogdXNpbmcgTVNJL01TSS1YLlxuIik7
DQogCQl9DQogCX0NCiANCi0tDQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
