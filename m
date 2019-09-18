Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC2B59AA
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 04:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21A16EDBE;
	Wed, 18 Sep 2019 02:25:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AAB6EDBE
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 02:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6onEtFoWtxI/fhhedVWSpqtMSU7z1NTw8HCtliJ1onK7ODdFrMhW0CtRULBnDjpFWjmo+T41relrBnhhUff4cBxyJ+P3EwQ+p/gMzvMVAZvCL/8L1DzYZ21n1ygc37kXtFZ0BqeFlKRazSU7XQvxByz8P3mnbfOBtPKiL66RQGiZXtnnopXYuzAbSXWwKTgZm/qzmQo1/3wgf9L5EU3GkEbjuPV4bZKo8Gi464QcFkgne0mzJ4Y/5b4QftOXX31+3ZTcybiD3pkCkUmpqlHCmaQlORTg/P4a36w+KE8MBe3xd6NtyFzrEYCaUpl6wm3HeM+NDm7M5G9l7TSJgzIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ThNhX1/Cke66jm25jNAKMZrQluWEJJIkwZpdGYOvE=;
 b=nyMyCKmbrwH0PsI9PSUNyMy6kaHVyksJRYU7MNsVkspu7d1DiXOWc/dlw/eLZ8pq/VqjBael/eXWh3h3op550zCatJDIMLut8Xt5iVh7ET6eYTLA5RmoRz0pKTRP7X9llRVOvEV0tIzpXU9/QH2YkxgheoSeZy1OhKrPqRmpnj7McvFi/mB3tfKkZmq7VS3mbv83hxjVYComLPMDn+JRJ0Lmmn6PrTV271zC4xPx8qlFProZEjODnjTHdCH3EqitvigzWs/MeUYVYKL30dtydmu0y/pS8zs2IoT/RNSC2wesAqxJi3V0lPjJCgzrw/UtYmJYiNp+Lngp3YpL3CmBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3845.namprd12.prod.outlook.com (52.132.245.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 02:25:22 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 02:25:22 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Clements, John" <John.Clements@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add psp ip block for arct
Thread-Topic: [PATCH] drm/amdgpu: add psp ip block for arct
Thread-Index: AQHVbazZc/fSn9WQJk+Qu2YQdLR8n6cwtUPQ
Date: Wed, 18 Sep 2019 02:25:22 +0000
Message-ID: <CH2PR12MB3767E68B42B842F4479F3BFBFE8E0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190917230828.6818-1-Hawking.Zhang@amd.com>
In-Reply-To: <20190917230828.6818-1-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 872b7ffc-6b3c-42f9-9191-08d73bdf74f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3845; 
x-ms-traffictypediagnostic: CH2PR12MB3845:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3845DE914C8A6ADDAE841AE4FE8E0@CH2PR12MB3845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(13464003)(189003)(199004)(25786009)(8936002)(316002)(229853002)(6246003)(186003)(71190400001)(66066001)(7696005)(102836004)(478600001)(4326008)(66946007)(9686003)(81166006)(966005)(66476007)(76116006)(64756008)(81156014)(8676002)(66556008)(6636002)(66446008)(71200400001)(33656002)(55016002)(6506007)(6436002)(6306002)(74316002)(14454004)(7736002)(476003)(14444005)(86362001)(256004)(26005)(52536014)(53546011)(99286004)(305945005)(76176011)(2906002)(3846002)(5660300002)(11346002)(2501003)(6116002)(446003)(486006)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3845;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JWDCFW90Lx5vQeuyzVX9NnI3UX6uu9439OvxDRqchYEAzYHDXxk28Eb/IvVMcQiUiWCaKKoGJSn1eyZOAFYupqd/CnwXVf4LLRT5hevWyibYKjE5CgBO4AbaSj6eOGxWAkOa8EskXujQ52gBxxU3CaltYnaoPdrOtEexSckQFmundKyNfMMtPTbSVdti0bmNzxiBd9OsdzW/CBY10wQDiOn4JCORMVf5h1dtF0nLx0sw5lmRdw6mT/VzCEuvxLa8MVQt+bjlWflbkquSK+ccRrW0DLaLXNDH8YKVN5rIAJnxwEk2T5CUfjX+2FdDabMvs7VgBRtI3rUzW8V9urjj+brnFW4vBr3a9O+81WyNjwDCuoJmCYiPnLTxtTxH80S4mDwxYw1Yq1j57W5RIrOxQhBjYgjAjjGGs4hveEYJhjg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872b7ffc-6b3c-42f9-9191-08d73bdf74f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 02:25:22.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTrii45bZVHVX4c+JqmCENNothqpLlwtsTb7trwqXjmckdvOTI1APoykm2iaJQtx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ThNhX1/Cke66jm25jNAKMZrQluWEJJIkwZpdGYOvE=;
 b=jD03r/ffFTXP/cmtpD5MwX+DzTER1oOagKZLKnxzUoSBHVoyIlh+iBM3Ai+80nOiWRB39VbGsHGN4+2hu9Zv0ky+MWqNNpNJ975q+hmI3lzKinrJqe9IYo3VVGI4n99ncNNTTF/D45MZs+yPdqy2UDFdn3yA/00Edrx603ZJID0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nDQpTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSA3OjA5IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IENsZW1lbnRzLCBKb2huIDxKb2huLkNsZW1lbnRzQGFtZC5jb20+DQpDYzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogYWRkIHBzcCBpcCBibG9jayBmb3IgYXJjdA0KDQplbmFibGUgcHNwIGJsb2NrIGZvciBmaXJt
d2FyZSBsb2FkaW5nIGFuZCBvdGhlciBzZWN1cml0eSBmZWF0dXJlIHNldHVwLg0KDQpTaWduZWQt
b2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCAyODRh
NjQzNWJmZGMuLjZmYWExZjYyNTg5NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMN
CkBAIC03NTUsNiArNzU1LDggQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVn
YTEwX2NvbW1vbl9pcF9ibG9jayk7DQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2
LCAmZ21jX3Y5XzBfaXBfYmxvY2spOw0KIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJnZlZ2ExMF9paF9pcF9ibG9jayk7DQorCQlpZiAobGlrZWx5KGFkZXYtPmZpcm13YXJlLmxv
YWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApKQ0KKwkJCWFtZGdwdV9kZXZpY2VfaXBfYmxv
Y2tfYWRkKGFkZXYsICZwc3BfdjExXzBfaXBfYmxvY2spOw0KIAkJaWYgKGFkZXYtPmVuYWJsZV92
aXJ0dWFsX2Rpc3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KIAkJCWFtZGdwdV9kZXZp
Y2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9ibG9jayk7DQogCQlhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3Y5XzBfaXBfYmxvY2spOw0KLS0NCjIuMTcu
MQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
