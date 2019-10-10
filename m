Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBACD27DB
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 13:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA166EAFC;
	Thu, 10 Oct 2019 11:19:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680077.outbound.protection.outlook.com [40.107.68.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11756EAFC
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 11:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APc/bYg9F2WCfGri3latYZXUgxeSRSaKWtxvIagFPXxg+GKH4OMPcAzfR0J1gvonP/Gp3BilZRIhz3bDi08d6CrKbsKVG/gwAVlSmeC3K5voZQWh6BYUgmCuCgfibL9Oc8Gafi/CAZvsYJG8dkC1BLKUpzi2MQxVbAiCEMg2dixOS7GASBOHUuimRvP3BZvgBBi5Ug/U8xoOekHXTcyTQkVJpuiVPVk8xrUiUJot2/8LM0LilcQnF+It5TxBaCejfRrzmnEFGuudT18kkxOA8xBZj9ifIsZoIV3Uw0T5EthQ37Hy4jQT3IBLYiUqSzo+FPBG9K9n+EUYAFttVmgr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh44GK9V73lG48xu0dqHPH2Bfs7fOqATr/NWD9ccSAE=;
 b=Xb2VKOrCl1VkETqyB6MLpHxoibihoOGk5QWg6A3TkZ1ZmRJJmFWP9T7AYveUPKg5Ye6OeYPnHUCo8oJJX0ok/zDaaHbJToFhMGBjYEcLd7iUhy2EqXPZcs6SXpWVKVIJJfkADniODFG7w0XJDCMR+S/DQ1XQi3gKU634kkjdsfOaWcOjdicZ8ArdCRojHJq5eoF2bDKMMmHeSUTRJNNWzgc8vNsawWTmJpaJ3en443TpQftQtHMGEBaST78dB1NR84Dx/fJUpCrjGqChZYsS0tdR2zmcPBeACGOpijmIUej8gTeROmTSNJ6YRwB2ZdHWk7FSVhu9j6rP+tgDs3ZcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2471.namprd12.prod.outlook.com (52.132.141.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 11:19:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Thu, 10 Oct
 2019 11:19:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [RFC PATCH] drm/amdgpu: fix amdgpu_vm_handle_fault return value
Thread-Topic: [RFC PATCH] drm/amdgpu: fix amdgpu_vm_handle_fault return value
Thread-Index: AQHVf1drWqr2fC/nME6tQ0raXCiAwKdTupCA
Date: Thu, 10 Oct 2019 11:19:53 +0000
Message-ID: <df4bd681-d745-4cb0-3dec-38e826f4c9fe@amd.com>
References: <20191010104214.38728-1-nirmoy.das@amd.com>
In-Reply-To: <20191010104214.38728-1-nirmoy.das@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0119.eurprd07.prod.outlook.com
 (2603:10a6:207:7::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2687cb33-f035-41ee-003d-08d74d73c5d2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2471:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB247189AD1B7A1E38D3CBD21C83940@DM5PR12MB2471.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(189003)(199004)(65956001)(65806001)(54906003)(58126008)(110136005)(316002)(8676002)(81166006)(81156014)(8936002)(66476007)(66946007)(36756003)(478600001)(486006)(5660300002)(66446008)(64756008)(4326008)(66556008)(11346002)(446003)(71200400001)(71190400001)(2616005)(14454004)(476003)(6246003)(25786009)(46003)(4744005)(52116002)(76176011)(6486002)(6116002)(6506007)(386003)(186003)(6512007)(6436002)(2906002)(31686004)(229853002)(99286004)(102836004)(86362001)(31696002)(14444005)(256004)(305945005)(7736002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2471;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fc+F3ySj2Lvg2GNAOqfDHQu7GCRv5P3sdcJ1VTrENzw9k+3mi/E9Ge3/uBxOy479nFoSc31f4JNPqJdOWuLqq3qUBheZ2wgFo8//lPzX32Iwze0urfTJDwAcT4LTJR5xgY/c2wFiBR+YMFH2I8yTdhYmUAVut8CMchHVxaaHM7Ar0UuVKebT0PEX/4hxH5Obwwualh2xRPnKGCy2eMK6F5RSvC7kSJ42dT8qb6uiQUBVCpY1qKLeYIG6rqqtd7uTLovod/ilZVToNYk0Wh2/LpuY3A0UV1PR7RYdKh4Wn5wHEIS46rFVURi/D9RNRkog3g88JiXugBXyPE0vm2FTeSkSnye54cJ8qKZsqNy4nyWMT+74AolKyPP88fUGNQBn3b6CSh66UmYXySBwSLL+LHhu++A/mcaIbF8GQSa1afs=
Content-ID: <092D4D3ED03AE449A2A431AFF44DDE8F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2687cb33-f035-41ee-003d-08d74d73c5d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 11:19:53.3935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqQS33NTkC5OOjAOjFPG17EcNOQI5jEzLxgfYsuZCBf+e3/7h7Qz1fQUpW3i9mMG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2471
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh44GK9V73lG48xu0dqHPH2Bfs7fOqATr/NWD9ccSAE=;
 b=RYnSnQPy06QpaPkUPKcfQbKpnJ/nD/XXgTE6jQ3pMZoCwZjlVNnMy+8bApr/xo72W/Xp/hYrK+8YJakatdWdJEff6jPNbpyDMO3m27rrGnYJ7vF1D3Thr5f0Uh5ICKHPNMO/10HTCoAGohNOR6GnWhcfFPQnH9Yscm2Br9NGj04=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTAuMTAuMTkgdW0gMTI6NDIgc2NocmllYiBOaXJtb3kgRGFzOg0KPiBhbWRncHVfdm1faGFu
ZGxlX2ZhdWx0IHNob3VsZCByZXR1cm4gdHJ1ZSBvbiBzdWNjZXNzDQoNCk5BSywgdGhhdCBpcyBp
bnRlbnRpb25hbC4NCg0KVGhlcmUgaXMgYSBmb2xsb3cgdXAgcGF0Y2ggd2hpY2ggZGlkbid0IG1h
ZGUgaXQgaW50byBvdXIgc2VydmVyIGJyYW5jaCANCndoaWNoIGltcGxlbWVudHMgZmF1bHRzIGhh
bmRsaW5nLg0KDQpXZSBjb3VsZCBhY3R1YWxseSBjaGFuZ2UgdGhlIHJldHVybiB2YWx1ZSB0byB2
b2lkIHVudGlsIHRoYXQgb25lIGxhbmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jDQo+IGluZGV4IGQ5YmVjZTk4N2U2MC4uNmY0NjhjNmZmZWYyIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiBAQCAtMzIxNSw1ICsz
MjE1LDUgQEAgYm9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1bnNpZ25lZCBpbnQgcGFzaWQsDQo+ICAgZXJyb3JfdW5yZWY6DQo+ICAgCWFtZGdw
dV9ib191bnJlZigmcm9vdCk7DQo+ICAgDQo+IC0JcmV0dXJuIGZhbHNlOw0KPiArCXJldHVybiAo
ciA9PSAwKSA/IHRydWUgOiBmYWxzZTsNCj4gICB9DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
