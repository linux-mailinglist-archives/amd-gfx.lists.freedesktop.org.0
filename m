Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69853D3A97
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 10:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89189F63;
	Fri, 11 Oct 2019 08:13:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C989F63
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 08:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+UpZ/5LAaZmnsCecF4UluVDyVhjLoRhdwQjeiagGR9RL5+BAeKNGbYmVmJocK/IZ0EIrls6NUjmPFvUxJDiFfuLezZTH0iUuBr6Glc5Zs92Qb9XchowavYZBqIKHOLE9GK+FlMkCwcwLe0buLqRAJjaTtDpg5/vtGRjycmadZdwWLFYAseZYkGKF453noVi+1HaPYfUcrbTO26Snm/lrM2fRTvPxz6JmuBzlt2+wvcRKn4Z/ARuFXzG0i7OePRjJZyY5XAtS0r2k2TrSwMDP1YUpEnrdLBZoXYok8oXX51Fn/wWmosCZIrj8EMzB8l3qvl96it9MCKlD9GXRYWyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGNrm5hFQE12ytAgvEFIT1QzUYM1a1o4E0Ny6ddKXgU=;
 b=BYwpUY5OlZos4ZpcGJ3A19wsy8x6DToF8Q2W6YNDknxva/tw8q0oNPoIR82xj9Fjzc3eD9MBkdMQW9hnWpRtU/yloZOsZRYlWnFtqYy6hlBbLw3OXMbFV5C67FLrgtTrhvaQnXD/sA9IwAF4ayxruc7IPomkE+t7B6tfg9zNkSDGS/08IOhSQiFsm6PJwuZnoSo6JLRvytTMNgAFzc4y9DTiMggP2ljosJysfBcMl/sIO6k+BC5aNhUIy1+fv0tsbBLCJBioLT09VWHL+vGTfAEwV12QixnsF6+77tAqfOX57y+HMrqzDHCVGj7N3jBgutIy1UBmahO4wrjPgJ65UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1850.namprd12.prod.outlook.com (10.175.86.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 08:13:21 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Fri, 11 Oct
 2019 08:13:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>
Subject: Re: [amdgpu] ASSERT()'s in write_i2c*retimer_setting() functions
Thread-Topic: [amdgpu] ASSERT()'s in write_i2c*retimer_setting() functions
Thread-Index: AQHVf8NKQ/aTeEhoJkKXmQQDDFRUiadVF+4A
Date: Fri, 11 Oct 2019 08:13:21 +0000
Message-ID: <223e04b0-b855-96e9-f984-70a1d47235cc@amd.com>
References: <CAEJqkgi-9_1D91GUm_MbS-=RRRwMZjqEYWhCCdk+STvc0PeYXw@mail.gmail.com>
In-Reply-To: <CAEJqkgi-9_1D91GUm_MbS-=RRRwMZjqEYWhCCdk+STvc0PeYXw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:200:89::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95e57baa-eddf-4afa-e14a-08d74e22e12c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1850:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB185049C10388E80A896B783B83970@DM5PR12MB1850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(66556008)(36756003)(8936002)(86362001)(64756008)(66446008)(31686004)(66476007)(66946007)(31696002)(71190400001)(71200400001)(2906002)(6306002)(256004)(6512007)(6246003)(6436002)(5660300002)(6636002)(4326008)(6116002)(8676002)(81156014)(81166006)(11346002)(7736002)(305945005)(316002)(6486002)(52116002)(476003)(229853002)(2616005)(478600001)(102836004)(386003)(6506007)(76176011)(446003)(486006)(186003)(46003)(58126008)(65806001)(65956001)(54906003)(966005)(25786009)(99286004)(14454004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1850;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yTv0Xc/+T+9hZGAAgMiS54mMGAm9LYInQRwJblcenkkhDcnMPJXEgxdx0xW+IaPZpqjaV7Unc8+OGgMhLRBGPQBVHXia7Dxux/3U75aF43tt7wW7xZLtEazhtSWucgZian1f/6W0UfkP+2TsAZogZXz3AWPOTQCFhqVTuyMUhhwEI8IcuGgKnydkSM0w++VoWV4Ct1GcbbNGc2t274A2IetvDgKWw/wW3EsmKrPB8zqbqPrF4lK9hhPwoVCypwS65Hz19Bnvac+DZl8BNK47aV+VmbDfDIRAMBSBOulqiSkKuk+dYYQbV/9qfzZE3A6jDMR/BSDkQjYY3M+PSuycqMN1L48PgR1KZfxcpaIj+vGwZqUOfyy6cly05WqEdV8yLxH8aJZ4Mgfl2lnNeHFSpoYTj0sFlNhtLmW7PScL0xsuH1klEeGq73yqBJMN6/YHf7RUnCl3/lmAsWTp9JYSyw==
Content-ID: <1F26EA3A7C736248A189AA55319622C6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e57baa-eddf-4afa-e14a-08d74e22e12c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 08:13:21.3692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJ2c9aZCzFxNolzp2DmaorsgWRZlHLZfPJQqhC5fWb/+iaMV8uwg/V7zhceGCorD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGNrm5hFQE12ytAgvEFIT1QzUYM1a1o4E0Ny6ddKXgU=;
 b=W8oq9f4iT/5AqP24xzSp7MldaA65kMUpnbf+GAxQwL+BHzJQQ750RjI4Xs5JpOy8MnBAkA/mj1PArzG94vbtMQKZyHG2V4oZK2oF79C0NHJxp+PXCDCbNmu9iJDHAcD1s96CSk6HY5A6xY3MEjfVRNaDoXd3F8NS2c679XwhX3E=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Gabriel C <nix.or.die@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Zeyu Fan <Zeyu.Fan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yd2FyZGluZyB0byB0aGUgYXBwcm9wcmlhdGUgZGlzcGxheSBmb2xrcy4NCg0KQ2FuIHlvdSBn
dXlzIHRha2UgYSBsb29rPw0KDQpDaHJpc3RpYW4uDQoNCkFtIDExLjEwLjE5IHVtIDAxOjM0IHNj
aHJpZWIgR2FicmllbCBDOg0KPiBIZWxsbywNCj4NCj4gSSd2ZSBidWlsdCByZWNlbnRseSBhIG5l
dyBib3ggd2l0aCBhIFJ5emVuMyAyMjAwRyBBUFUuDQo+DQo+IEVhY2ggdGltZSBJIHBsdWcgaW4g
YW4gSERNSSBjYWJsZSAoIHRvIGEgVFYgb3IgTW9uaXRvciApLA0KPiBvciBib290IHdpdGggSERN
SSBjb25uZWN0ZWQgYSBsb3QgQVNTRVJUKCkncyBmcm9tDQo+IHdyaXRlX2kyYypyZXRpbWVyX3Nl
dHRpbmcoKSBmdW5jdGlvbnMgYXJlIHRyaWdnZXJlZC4NCj4NCj4gSSBzZWUgdGhlIHNhbWUgb24g
YSBMYXB0b3Agd2l0aCBhIFJ5emVuNyAzNzUwSCB3aXRoDQo+IGh5YnJpZCBHUFUgY29uZmlndXJh
dGlvbi4NCj4NCj4gQmVzaWRlcyB0aGUgbm9pc2UgaW4gZG1lc2cgYW5kIHRoZSBkZWxheSBvbiBi
b290LA0KPiBldmVyeXRoaW5nIGlzIHdvcmtpbmcgZmluZS4gSSBjYW5ub3QgZmluZCBhbnl0aGlu
ZyB3cm9uZw0KPiBvciBicm9rZW4uDQo+DQo+IFNpbmNlIHRoZSB3cml0ZSBlcnJvcnMgc2VlbSB0
byBub3QgYmUgZmF0YWwsIEkgdGhpbmsgYSBmcmllbmRseSBtZXNzYWdlDQo+IHdvdWxkIGhlbHAg
bW9yZSBpbnN0ZWFkIG9mIGZsb29kaW5nIHRoZSBkbWVzZyB3aXRoIGR1bXBzIHdoaWxlDQo+IGV2
ZXJ5dGhpbmcgaXMgd29ya2luZyBwcm9wZXJseS4NCj4NCj4gV2h5IGlzIEFTU0VSVCgpIHVzZWQg
dGhlcmU/DQo+DQo+IEkgaGF2ZSBhIGRtZXNnIGZyb20gdGhlIFJ5emVuMyBib3ggd2l0aCBkcm0u
ZGVidWcgYW5kIGEgc25pcHBlZA0KPiBmcm9tIHRoZSBMYXB0b3AgKCBub3QgbmVhciBtZSByaWdo
dCBub3cgKSB1cGxvYWRlZCB0aGVyZToNCj4NCj4gaHR0cHM6Ly9jcmF6eS5kZXYuZnJ1Z2Fsd2Fy
ZS5vcmcvYW1kZ3B1Lw0KPg0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBp
bmZvcm1hdGlvbiwNCj4gSWYgbmVlZGVkIEkgY2FuIHVwbG9hZCBhIGRtZXNnIGZyb20gdGhlIExh
cHRvcCB3aXRoIGRybS5kZWJ1ZyB0b28uDQo+DQo+DQo+IEJlc3QgUmVnYXJkcywNCj4NCj4gR2Fi
cmllbCBDDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
