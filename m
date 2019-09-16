Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C056B3FBF
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 19:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B5C6EA14;
	Mon, 16 Sep 2019 17:48:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579F66EA14
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 17:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKRkUMKgHD2s29QAQMOICcUGP8Kelb+Nyp7nb4xpkRHc/e19TZ5eKLjye5GyaBx86kGYuxJUKDjThNeX5YYZEqLr1f67qu8OsPzhJ0NHXmKnu7u/pC+oTvaRLBI5XHb8n1UkVKguX2+Fi+VYklW8DxZW/uj5BPqUbdUVUfxXL6n+T43Jp7XpB5xj4iaQWY9WQaFGNd0tELaOJaJk+uVWvN09HxnAdizzi6wZxLZqUXzIm4/Axz2IeHyOrf6KmuDPyrmLlOH4RpByC2XmEueDjZq9fGqBNIreEq99ZNqCGa0DSx+V5upX33jkQ3W1YN06uUTMSDn5IxRQb5gpTYFppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UnZgW6ozKZzRT7njmTyd9+YRyOQnp89Me5SYNVh6Dk=;
 b=RvezU5m1GLXA4MaTF7ZR906LNS5KeJD86s1zZ3FTqHS7yYi52zNXwdPmeH9aUcodcUjwdSCEzJUQCyTfUzYX4TPr6LULhNunDnZsIDR6nVV1M945xGVf6Ps1Do3f3ni14Z5HsLaulcs59a5LmmZOGWNc7W/FsQVZfjhXd5i61oE4nl+9ITqO4+18Y8YaRKo1kqdeYQdKXCeYMUcL1uQljeVUlh+wcXpfjp3TNVCkq9bXsH8FMG0ie3BHKD8K0ayQXi8on7Jz1MIHnK5AWk4gWR63Iv4Qr9sOz4e6ZgMjCPqN4c+6FzZxP7qKDoAMZW59uymhmzlAd5vhuWHAnD6MKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2857.namprd12.prod.outlook.com (20.179.71.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 17:48:30 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 17:48:30 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Topic: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Index: AQHVbKxqAZyQIFcNBEuqzE/XNaiBQ6culIsA
Date: Mon, 16 Sep 2019 17:48:30 +0000
Message-ID: <a9b4c968-66f2-389b-15a0-85d65f33e7c1@amd.com>
References: <20190916163252.23684-1-Yong.Zhao@amd.com>
In-Reply-To: <20190916163252.23684-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11756d09-72df-49f4-c90f-08d73ace15e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2857; 
x-ms-traffictypediagnostic: DM6PR12MB2857:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB285782116A120D2DF4DCF1D9928C0@DM6PR12MB2857.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(2906002)(229853002)(8676002)(26005)(71190400001)(65956001)(65806001)(7736002)(305945005)(36756003)(71200400001)(478600001)(66446008)(64756008)(66556008)(66476007)(66946007)(316002)(446003)(11346002)(110136005)(25786009)(5660300002)(58126008)(486006)(31686004)(476003)(6506007)(53546011)(53936002)(2616005)(14454004)(3846002)(6116002)(6512007)(99286004)(4744005)(14444005)(186003)(6486002)(66066001)(8936002)(256004)(386003)(81166006)(2501003)(6436002)(81156014)(102836004)(52116002)(76176011)(86362001)(6246003)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2857;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ADDXev3b16pwxY9GLA52GAdud7TKZO2vEcWeKYGZ0NcRtMpFN5D95o3yYANnSKVnl/304IR9KyCgtZ5lyVcQIh7ccwD4iLDX5B/bmk+2NPxiPn++n5f7lzcr9GGIkHSsV8wyLYSjlQTpxenRTJwhXfwfN+tep+rTSAP49i7xIfXxntNkAOhgqUCXtOldguoVIgShemHwaUiP5tk7dFn29SJAqk999CSe+vMEo4HfgkDHdmrMk8xnRRqI4L/Bgb0cdIQj4CdScx2dbBRY652RlLZv1elyU37RGgyLzTskMF7jNoTcPN5RXr/j/7J4qUK20EkYSOI/susmS8pRlGSbhIPyTfHFh/ZfLfWLrbEhbV8/a+DURMLp5qAJR2DV/Ks6nHbt0b6NTJ7t7c104BWgyVdE3azVpTWQRSDMUcHjdsg=
Content-ID: <B0CBEC3444A75947AF736EFFC98DD486@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11756d09-72df-49f4-c90f-08d73ace15e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 17:48:30.2291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBYsRb2NA1AqYSs0sFCjrY3wswQasELwOSNEFOgR/SGZv/bnBG9YPfIH2WVc180GER7xgEz6hJL7P42T96SZBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2857
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UnZgW6ozKZzRT7njmTyd9+YRyOQnp89Me5SYNVh6Dk=;
 b=inw86rEBeGbGIVxI2Tgwy9k+jagVthvnJwBwu6FJ+7cNILXsm1I8Pjaz7VVzo/VAR8lgf2/DlAOz/WoTB9dEsbL/g2ZIkk/qRN2tgDcTPQWDD9h9AavwtS00vd4TuoKd5ylbjFP/ehCYUA0jF08/I+7uhxPdwJdChfLBvj5sG8U=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xNiAxMjozMyBwLm0uLCBaaGFvLCBZb25nIHdyb3RlOg0KPiBUaGVzZSB3ZXJl
IGRlbGV0ZWQgYmVmb3JlLCBidXQgc29tZWhvdyBzaG93ZWQgdXAgYWdhaW4uIERlbGV0ZSB0aGVt
IGFnYWluLg0KPg0KPiBDaGFuZ2UtSWQ6IEkxOWIzMDYzOTMyMzgwY2I3NGEwMWQ1MDVlOGU5MmY4
OTdhMmMyY2I3DQo+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+
DQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4N
Cg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggfCA0
IC0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+IGluZGV4IDA2YmIyZDdhOWIzOS4uMDc3M2RjNGRm
NGZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gQEAgLTE3
OSwxMCArMTc5LDYgQEAgZW51bSBjYWNoZV9wb2xpY3kgew0KPiAgIAljYWNoZV9wb2xpY3lfbm9u
Y29oZXJlbnQNCj4gICB9Ow0KPiAgIA0KPiAtI2RlZmluZSBLRkRfSVNfVkkoY2hpcCkgKChjaGlw
KSA+PSBDSElQX0NBUlJJWk8gJiYgKGNoaXApIDw9IENISVBfUE9MQVJJUzExKQ0KPiAtI2RlZmlu
ZSBLRkRfSVNfREdQVShjaGlwKSAoKChjaGlwKSA+PSBDSElQX1RPTkdBICYmIFwNCj4gLQkJCSAg
IChjaGlwKSA8PSBDSElQX05BVkkxMCkgfHwgXA0KPiAtCQkJICAgKGNoaXApID09IENISVBfSEFX
QUlJKQ0KPiAgICNkZWZpbmUgS0ZEX0lTX1NPQzE1KGNoaXApICgoY2hpcCkgPj0gQ0hJUF9WRUdB
MTApDQo+ICAgDQo+ICAgc3RydWN0IGtmZF9ldmVudF9pbnRlcnJ1cHRfY2xhc3Mgew0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
