Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD7B15B4
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 23:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C38E6EE2F;
	Thu, 12 Sep 2019 21:09:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820087.outbound.protection.outlook.com [40.107.82.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B57A6EE2F
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 21:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvnfJetxedKSPWyJ8ZhGR06U8MKb3qWprRyvrg+Q/DzB7NXBG4a0wqi72D6h/jXL8BDL/xh4zHsCBgl7IIQMR41hQbwGpmK8zNCMhsHIBrfIgZNwJdqFOaRp9CvZg1pOSp0ISzQXsowneKXPIM7AK3Q+r85VmhTihCVz4+SmQ+Jx7YnbDrNn4OH2hJ45v3WBL5ve5OFfjjsUUkkYyTFGcoYgA3JHZh3TyueOemRq813DntEDwelDN6nTo+/eKv13Pgf1XYNQU5tzZynPcbAwk1dCH7s1q6SkklYO9aNiwJbo6CX3BMCtqpfPgsN01g5fz2m5i1x2flvZmN0iHrisxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbYtPB8RfxApA9wftIlvcuMqMUssw+3iSAMc5InDH6U=;
 b=LjuriCALlYUY0j6It71EAh6V5f5dEr2SxjC4VFk4DT5JhxiQU7kF0NIepPRPKsG1JvKlUo/8DAwWxUYH7+90FeSORyZRE9lWzyjTlKfQ5D8niHB4JCfvImyVGEbqRGmtjUTcthBXE4J5QpyS7+sPujn9DgDEmFHTtgE3NFuMLt3bQICOhrmORLW6T5z8DWO5bGh0dckwHqVFsBY3rjWhym+xH9Zix5yg3Ip88ovxXXSZ50PaFBmMNGNhUDUtHcLfBCrsPaLfONvjolvK11P5rTQDWTOSb5L963nGd7QrJUYamdLR6FA7UZibwW2JUFvryCK/Q4VSFTj+dr0f7rapuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3356.namprd12.prod.outlook.com (20.178.198.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Thu, 12 Sep 2019 21:09:24 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 21:09:24 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Index: AQHVaG2HB6z7JcsTPE2B5uyPrFeG+acnB3KAgACXsACAAOy2gA==
Date: Thu, 12 Sep 2019 21:09:24 +0000
Message-ID: <c0390567-4231-d816-de1f-721b26655d86@amd.com>
References: <1568184761-20949-1-git-send-email-shirish.s@amd.com>
 <f78eeb5d-bc32-b72b-8d1b-3fdee9ea43db@amd.com>
 <d547a716-d749-7a33-b125-7c785cd9b953@amd.com>
In-Reply-To: <d547a716-d749-7a33-b125-7c785cd9b953@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d539f269-a3a8-47e5-904a-08d737c57d0e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3356; 
x-ms-traffictypediagnostic: DM6PR12MB3356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33564A1912625764040EBE5692B00@DM6PR12MB3356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(86362001)(53546011)(31696002)(81156014)(6506007)(102836004)(8676002)(386003)(81166006)(305945005)(99286004)(7736002)(4326008)(6486002)(8936002)(6636002)(31686004)(14454004)(25786009)(2906002)(229853002)(478600001)(52116002)(36756003)(256004)(186003)(71190400001)(71200400001)(66946007)(66446008)(65806001)(26005)(66066001)(66476007)(66556008)(6116002)(6436002)(65956001)(53936002)(6246003)(316002)(476003)(110136005)(58126008)(6512007)(3846002)(486006)(64756008)(5660300002)(76176011)(11346002)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3356;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K840xCNJg1KNzSQQ/M80TxBq6LmT3K24QDJLZOSUCJ3l/yYFNrzOKKO3eQxrclr6Q688LToCsc1kWbEqOgXGDxds36xV6edg/lc8fn+SP1LEzHjaUtbvnZMO3C/gjgXZL44UMe4K0m/YGklesm03KXXPEhzbf0cYSxVFFnqzgkcmqQKNG3ktGdl44ck4zCtZw4ed1nxEx+zVrf5lDOKPJMT5qzvvYs/13J1Zz4JPSnZdEcS9XhKt12fEEITTN3gVFPyyY8Acc71zHOfoiQvsJtKaxzWql/ICJiDH9iTq/dPJWVPaK2kEW+VEmXwTMEuWAZlFJMkRvfotq2kf2F889aGeGQXDPf9RegTdk+haII20UQJixMEKpuyM18dzLc+gSZ8ke6aeLBwnuSWjEqSihQOJ4uA5fRvPevTJVmPhnYI=
Content-ID: <465407F2D29BFE4EA44E9273F11003EA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d539f269-a3a8-47e5-904a-08d737c57d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 21:09:24.3775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXDGr/6rlnBUAwQ5vzg/IXl2QHWyjtKYmwnVRU4kWRP4K5D6UY9oKroWjD9btRmUa/B1g5gBa+/V1Fdd0feDPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbYtPB8RfxApA9wftIlvcuMqMUssw+3iSAMc5InDH6U=;
 b=maXfO7D35kVkJqTHMc+roj+Zr/uh5lfpY57UGYbm1v6U1BJJkhUzXBRR3K7HmqBdtCR3Z+2JC/O8REvu/fKcvfZaaCb8lDR93qkp9ZKWIv1ogiVAjoDwIVciKZ/zsNPfSieKSxuyMQjNClmX3fPiWzPpw8FTQZDex97QcTdwlUw=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMiAyOjU4IGEubS4sIFMsIFNoaXJpc2ggd3JvdGU6DQo+IE9uIDkvMTIvMjAx
OSAzOjI5IEFNLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+PiBPbiAyMDE5LTA5LTExIDI6NTIg
YS5tLiwgUywgU2hpcmlzaCB3cm90ZToNCj4+PiBJZiBDT05GSUdfSFNBX0FNRCBpcyBub3Qgc2V0
LCBidWlsZCBmYWlsczoNCj4+Pg0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UubzogSW4gZnVuY3Rpb24gYGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdCc6DQo+
Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjE2MjY6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYHNjaGVkX3BvbGljeScNCj4+Pg0KPj4+IFVzZSBDT05GSUdfSFNB
X0FNRCB0byBndWFyZCB0aGlzLg0KPj4+DQo+Pj4gRml4ZXM6IDFhYmI2ODBhZDM3MSAoImRybS9h
bWRncHU6IGRpc2FibGUgZ2Z4b2ZmIHdoaWxlIHVzZSBubyBIL1cgc2NoZWR1bGluZyBwb2xpY3ki
KQ0KPj4+DQo+Pj4gVjI6IGRlY2xhcmUgc2NoZWRfcG9saWN5IGluIGFtZGdwdS5oIGFuZCByZW1v
dmUgY2hhbmdlcyBpbiBhbWRncHVfZGV2aWNlLmMNCj4+IFdoaWNoIGJyYW5jaCBpcyB0aGlzIGZv
ci4gVjEgb2YgdGhpcyBwYXRjaCB3YXMgYWxyZWFkeSBzdWJtaXR0ZWQgdG8NCj4+IGFtZC1zdGFn
aW5nLWRybS1uZXh0LiBTbyB1bmxlc3MgeW91J3JlIHBsYW5uaW5nIHRvIHJldmVydCB2MSBhbmQg
c3VibWl0DQo+PiB2MiwgSSB3YXMgZXhwZWN0aW5nIHRvIHNlZSBhIGNoYW5nZSB0aGF0IGZpeGVz
IHVwIHRoZSBwcmV2aW91cyBwYXRjaCwNCj4+IHJhdGhlciB0aGFuIGEgcGF0Y2ggdGhhdCByZXBs
YWNlcyBpdC4NCj4gSGF2ZSBzZW50IGEgcGF0Y2ggdGhhdCBmaXhlcyB1cCBwcmV2aW91cyBwYXRj
aCBhcyB3ZWxsLg0KPg0KPiBBcHBhcmVudGx5LCBJIGRpZCBub3Qgc2VuZCB0aGUgcmV2ZXJ0IGJ1
dCBteSBwbGFuIHdhcyB0byByZXZlcnQgYW5kIG9ubHkNCj4gdGhlbiBzdWJtaXQgVjIuDQoNClJl
dmVydHMgbXVzdCBiZSByZXZpZXdlZCB0b28uIElmIHlvdSdyZSBwbGFubmluZyB0byBzdWJtaXQg
YSByZXZlcnQsIA0KcGxlYXNlIGRvIGluY2x1ZGUgaXQgaW4gY29kZSByZXZpZXcuIFRoYXQgYWxz
byBhdm9pZHMgdGhpcyB0eXBlIG9mIA0KY29uZnVzaW9uLg0KDQpJJ2xsIHJldmlldyB5b3VyIG90
aGVyIHBhdGNoLg0KDQpUaGFua3MsDQogwqAgRmVsaXgNCg0KDQo+DQo+IEFueXdheXMgYm90aCB3
b3JrIGZvciBtZSBhcyBsb25nIGFzIHRoZSBrZXJuZWwgYnVpbGRzLg0KPg0KPiBSZWdhcmRzLA0K
Pg0KPiBTaGlyaXNoIFMNCj4NCj4+IFJlZ2FyZHMsDQo+PiAgICDCoCBGZWxpeA0KPj4NCj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4NCj4+PiAtLS0N
Cj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggfCA0ICsrKysNCj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+PiBpbmRleCAxMDMwY2IzLi42ZmYwMmJiIDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+PiBAQCAtMTY5LDcgKzE2OSwx
MSBAQCBleHRlcm4gaW50IGFtZGdwdV9kaXNjb3Zlcnk7DQo+Pj4gICAgIGV4dGVybiBpbnQgYW1k
Z3B1X21lczsNCj4+PiAgICAgZXh0ZXJuIGludCBhbWRncHVfbm9yZXRyeTsNCj4+PiAgICAgZXh0
ZXJuIGludCBhbWRncHVfZm9yY2VfYXNpY190eXBlOw0KPj4+ICsjaWZkZWYgQ09ORklHX0hTQV9B
TUQNCj4+PiAgICAgZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7DQo+Pj4gKyNlbHNlDQo+Pj4gK3N0
YXRpYyBjb25zdCBpbnQgc2NoZWRfcG9saWN5ID0gS0ZEX1NDSEVEX1BPTElDWV9IV1M7DQo+Pj4g
KyNlbmRpZg0KPj4+ICAgICANCj4+PiAgICAgI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX1NJDQo+
Pj4gICAgIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
