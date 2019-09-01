Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2353A4AC5
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Sep 2019 19:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E428898EE;
	Sun,  1 Sep 2019 17:09:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409AC89AEE
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 14:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CW+V6J0GNpjvXkWUtyu/2AHY9jaGvI7D2UPbIxIww6U5M5XArtkQypsL3/kPuMEB4a4MErTQ0UANi5i/NKNHadmwXpM6yTjj5Qdi4qoywsZZDIr92C3M0SC1XQd+VKw8QXZkR+FXhgIZNV3/7aCrUeT5jm50xUQy17E0BVZXMpdri+bd5KqRhhy2DxdlUeWW6DckCCc3gBiWEK2SIu0a1UAfqahj2fWEW7IcjzNE7fOAfzhlz2wxigRjIabfPCU5ekHVTvGftkhtanu+nqGJDAaoHlJm1ZcaZmWqbdqSUhOQoQ54OPir3+js1o2E7SmSY8FB6BcxJQ4rJtYoQJW6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44kbBuJGgASb63WzBT+5BGHyua/mHb1kQ8KHV/DxoN8=;
 b=Sr6pDonDd+ndFcxiV8N5dI1lxmkQokyxM6cqIN6OXpMZdjSjupoYsFLIny3cjOk3FirYuB09KN/oQTIhy6A0ZYxGZ2EsJsaCyCJcedQ7bJuVV3o2SS/HUdUS63v9F9gcL5zoNtS+a+v2trXZXiuHxYgUr8jvs1yXV8JkuU3iH8ATQXIzhXsqXNu4crmUrzarSHl1Frnv15P4HbuOBahvvmYQ04KvqaW/r3pGObIBR+B5BPmaWpxm2NYukSIxuL/SHpdgGnlM4cxM8SW7HuyNARd+yo1qNtw8huhrYwN8ZQ9HvverIMwIXvnq4NNRiJqyzf4ZEkz9A0OEtwwHTzlaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3439.eurprd05.prod.outlook.com (10.170.239.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Sun, 1 Sep 2019 14:04:12 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2220.020; Sun, 1 Sep 2019
 14:04:12 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Petr Cvek <petrcvekcz@gmail.com>
Subject: Re: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
Thread-Topic: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
Thread-Index: AQHVYKj5mlPClEJW+0KT4THjk5vfeqcW2u2A
Date: Sun, 1 Sep 2019 14:04:12 +0000
Message-ID: <20190901140409.GA1251@mellanox.com>
References: <dad0e51a-0f06-e2b0-cef7-3587207c2045@gmail.com>
In-Reply-To: <dad0e51a-0f06-e2b0-cef7-3587207c2045@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6b7206c-dacb-4a5d-6d92-08d72ee54412
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3439; 
x-ms-traffictypediagnostic: VI1PR05MB3439:
x-microsoft-antispam-prvs: <VI1PR05MB3439F43F00DB59ACF81240C3CFBF0@VI1PR05MB3439.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0147E151B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(189003)(199004)(256004)(6916009)(14454004)(8936002)(6436002)(6486002)(5660300002)(33656002)(53936002)(99286004)(6246003)(11346002)(2616005)(36756003)(3846002)(229853002)(102836004)(14444005)(446003)(26005)(386003)(6506007)(81166006)(81156014)(8676002)(1076003)(476003)(2906002)(186003)(66556008)(66476007)(66446008)(1411001)(66066001)(64756008)(7736002)(486006)(478600001)(6512007)(4744005)(76176011)(4326008)(52116002)(25786009)(71190400001)(86362001)(54906003)(6116002)(316002)(71200400001)(305945005)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3439;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PhXjtpLBM6z4bUS6I8CE/lHSB0BHjkqQ7SPIAy0V+peQ5joJO2gTSe8pWNvBiEylWnJT023gscS4n0K9SSxynDtrUawdFARG1JHsaiJQ4tndC8OA8btC42URcOTv/dTms+nkrC/sFb9wqP0mb7RvI3T5Rw0vX35feNCBhp3UACr3Ovt9YggoZjUnzU0GIuNs+ips5Ni6ucckyVfS+hZssijmvOQGx+9NQEMnANXybtR/I47p3S7O81TC/Tr5YzvdUtLckeqs1DSthcI/uaAtrlCCvyZ4lkEadXw2FJ1H02BgAoGP7VAyRaHeUxCEk6JQMCMFXobiRiqx/wiXzE8FnSm/Ku0wxvKrVZA2+l6quUTTECcm0tT/+TLgXkQ9tWfNeiTiohaAMD520KpUqaDmJjYFfNity5yrJSv2ds/PK5w=
x-ms-exchange-transport-forked: True
Content-ID: <D062E2C23132E1449ED4208B35528D3E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b7206c-dacb-4a5d-6d92-08d72ee54412
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 14:04:12.1720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IX8cv0PlUQNxUpU/KrPWAx5r2rGVPIW9fRzE1arS+0t8ojchyGiJppLP4xBdvogaK5YLfigVtS8oxkl8VMB1Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3439
X-Mailman-Approved-At: Sun, 01 Sep 2019 17:09:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44kbBuJGgASb63WzBT+5BGHyua/mHb1kQ8KHV/DxoN8=;
 b=OxAnTcZuGBAsXEVuX2+ZzlrRmfE792KThfreetGqtCP59xwT62BrL+hl3GQJWlp7Ai3r7cyxYeO26qIeaZGaUKSCTRMyXAXJzSdUCqPWsnGze9f2neeuLday7H0eJ+x0k1E9jqnJeFLg8rxM2jYuHHMdwq7JTG+UB77tDGDVkIY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDEsIDIwMTkgYXQgMTE6Mzg6MTBBTSArMDIwMCwgUGV0ciBDdmVrIHdyb3Rl
OgoKPiBUaGUgY29kZSBpczoKPiAKPiAJc3RydWN0IHJhZGVvbl9tbiAqcm1uID0gYm8tPm1uOwo+
IAkuLi4KPiAJbXV0ZXhfbG9jaygmcm1uLT5sb2NrKTsJCS8vPC1jcmFzaAo+IAo+IEEgcXVpY2sg
YXNzZXJ0IHByb3ZlcyB0aGUgYm8tPm1uIHJldHVybnMgTlVMTC4gVGhlIGNvZGUgd29ya2VkIGlu
Cj4gNC4xOS1yYyBhbmQgaXQgc2VlbXMgdGhlIHByb2JsZW1hdGljIHBhdGNoIGlzCgpIdW0sIHRo
ZSBjb2RlIHdlbnQgYXdheSBiZWNhdXNlIHRoZSBsb2NraW5nIHByb3RlY3RpbmcgdGhhdCB2YXJp
YWJsZQp3ZW50IGF3YXkuLiBJdCBtZWFucyB0aGUgY2FsbGVyIGlzIG5vdCBjYXJlZnVsIHRvIHBh
aXIgcmVnaXN0ZXIgYW5kCnVucmVnaXN0ZXIuCiAKPiAJZHJtL3JhZGVvbjogdXNlIG1tdV9ub3Rp
Zmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFkZW9uX21uCj4gCj4gYXMgaXQgcmVtb3ZlcyB0aGUg
TlVMTCBjaGVjay4KPiAKPiBGb3JjaW5nIC1FTk9ERVYgaW4gdGhlIHJlZ2lzdGVyIGZ1bnRpb24g
KGFuZCBpbW1lZGlhdGUgcmV0dXJuIGluCj4gdW5yZWdpc3RlciBhcyB3aXRob3V0IENPTkZJR19N
TVVfTk9USUZJRVIpIHdvcmtzLgoKSXMganVzdCBhZGRpbmcgYQoKICBpZiAoIXJtbikKICAgICAg
IHJldHJ1bgoKVG8gdGhlIHRvcCBvZiByYWRlb25fbW5fdW5yZWdpc3RlciBlbm91Z2ggdG8gZml4
IGl0PwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
