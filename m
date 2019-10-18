Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C877DC2CF
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09EF6E0C1;
	Fri, 18 Oct 2019 10:32:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0B6E0C1
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 10:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUC42y9U8y7oZQ24gJHcis4AFeBqaGR3O1GbmBmjSkDCFh84IkJjN/t2GINJFkMWdO9QXfAdtZ7ir5YBq909Fv6Y/m99K5LXgUfPWOzZi5tSC6rbVABpyGVmr1IoNfI06/nfxKyFMN/1agtptQyrezmUXAVYjLhSMm2ZtgwdtFz6TvgwjUrL04LQsnQop+hnDGeo2msCFNBxVyZOlfPwDrqBqkqt480mIgw8ngucEnYvlyfMGalMLgWPdPRRlk6xqOpsVbWXXkQFnmzx0AqBLcRC0yWW3NfNQnzPCB/g7sDuImvmDFxHJKQr3zCUL1m9xuuR/qzYOiiZFungVciTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCPpLtlFxLAR2buf/RirTkQZ29VBeUtoZhHyug3EeWM=;
 b=NcKnUcSecJ3z2M0jlaS75u4TFbijcBYP270pDcx9DE/5QwQI47HQsvxrpRJw8ftih1WdN0vYm7HvFBm5KghRoM6OogRTJNxzoXuMG7zl5716wFhEwuy4djdIqIt4vX44Or65FrPd8I0j3qF3NOUhshSrEqn6IAm5HDJm9mGZXoi4nA6rjZ5dmtriaER07He5UmERK/wF+DxnV3CokJSCdLaHZxMKUl4c/58iPdQYi23Sr8FVD10u0kZwNYv+N/W3Xc8CJHPwzstmXvajU+NRuDBAJ+p+nbx23aQZVTNejUYcyRLv7LOx08oSyAMSzhJWyDBdt6cgVUlYysbWs1RvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 10:32:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Fri, 18 Oct
 2019 10:32:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sylvain Munaut <246tnt@gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
Thread-Topic: Spontaneous reboots when using RX 560
Thread-Index: AQHVhQ4nQfePts2grkK4xRAd+AGtiadfMmoAgAARz4CAAPA6gA==
Date: Fri, 18 Oct 2019 10:32:08 +0000
Message-ID: <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
In-Reply-To: <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 214724c5-ce6b-49bc-dc32-08d753b66db7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2535:
x-microsoft-antispam-prvs: <DM5PR12MB25358732755CE9D59F53698B836C0@DM5PR12MB2535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(54906003)(58126008)(316002)(2906002)(6116002)(66446008)(66946007)(66476007)(66556008)(64756008)(7736002)(305945005)(6916009)(31686004)(478600001)(6512007)(4326008)(25786009)(6246003)(8936002)(8676002)(81156014)(81166006)(6436002)(1411001)(14454004)(229853002)(6486002)(86362001)(186003)(446003)(76176011)(5660300002)(31696002)(52116002)(386003)(6506007)(102836004)(256004)(14444005)(4744005)(2616005)(71190400001)(71200400001)(36756003)(476003)(486006)(65956001)(99286004)(65806001)(46003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2535;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ROPc4eM+HxTWXP0W0qKL0/3Y6mJKPLEa0xfeUHLUBVKYDc26KzIrBPwUO2rzWHcsla34jH4Hawycd9K3RYtj621IvpKFtmfesnIL2I66Fl+uZISJXmI/s0pAm+/zCvIm6A4BXlWc7+wrCAOCYTPCUvRu6ho6se2CjWO6qqevyC7YHmwXx9Fg+VCKwwKsTjZUmZjR6rHZdDowrN44QjvewCX6Ouu7Z+Jx9HBWkh9mtDcTZBr8lckxv7amYX+CqblJPcnV8vUhqlJ62rkcEY76WKXRBhraB2tx0nT1hQ30MKfNMNrd+MO8igHqBcwpBgzuwHKSAf52zwCm413SRhD9FjMRDsFwZsoOhcnBAYts3U1ve4N1H0QWf4Zus7QBiQ+b1c6Ulbprx4fIg8ExTJr83kdNjNt+4Z2LKUrmFF1Le8=
x-ms-exchange-transport-forked: True
Content-ID: <073CA8BC96451B47B483E914AB6E41E8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214724c5-ce6b-49bc-dc32-08d753b66db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 10:32:09.0231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ASZy9DwKeyTkLLNty3FNh653m0ru2X2gBeaG83NUAsHaPM95Ou1jCu93qXurZOe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCPpLtlFxLAR2buf/RirTkQZ29VBeUtoZhHyug3EeWM=;
 b=zFzkKwb6ZCxeeZaJUdrzIypQyKSKUuZ2+TINKTi8VOleswdTli3YEww8wDGBS3+ZnFbSXMi4wwn0TG7jLBny8NxVeCEpT3wVZgu+KUGBlSUQj2auTtoQuIUI11J8zD6267I0v+pj2x3B42FDLsoTsIPrez5P/+zB0dYJtJMwoIs=
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMTAuMTkgdW0gMjI6MTIgc2NocmllYiBTeWx2YWluIE11bmF1dDoNCj4gU28gYSBiaXQg
bW9yZSB0ZXN0aW5nLg0KPg0KPiBJIHdhcyB1c2luZyBhIGJpdCBvZiAidW51c3VhbCIgY29uZmln
IEkgZ3Vlc3MsIGhhdmluZyAyIEdQVXMgYW5kIHNvbWUNCj4gb3RoZXIgcGNpZSBjYXJkcyAoMTBH
LCAuLikuDQo+IFNvIEkgc2ltcGxpZmllZCBhbmQgd2VudCB0byB0aGUgbW9zdCBzdGFuZGFyZCB0
aGluZyBJIGNvdWxkIHRoaW5rIG9mLA0KPiBfanVzdF8gdGhlIFJYIDU2MCBjYXJkIHBsdWdnZWQg
aW50byB0aGUgbWFpbiBQQ0llIDE2eCBzbG90IGRpcmVjdGx5DQo+IGNvbm5lY3RlZCB0byB0aGUg
Q1BVLg0KPg0KPiBBbmQgZXhhY3Qgc2FtZSByZXN1bHRzLCBubyBjaGFuZ2UgaW4gYmVoYXZpb3Iu
DQo+DQo+IFNvIG9uIG9uZSBoYW5kIEknbSBoYXBweSB0aGF0IHRoZSBvdGhlciBjYXJkcyBhbmQg
aGF2aW5nIHRoZSBBTUQgR1BVDQo+IGluIHRoZSBzZWNvbmQgc2xvdCBpc24ndCB0aGUgaXNzdWUg
KGJlY2F1c2UgSSByZWFsbHkgbmVlZCB0aGF0IGNvbmZpZw0KPiB0aGF0IHdheSksIGJ1dCBvbiB0
aGUgb3RoZXIsIEknbSBubyBjbG9zZXIgdG8gZmluZGluZyB0aGUgaXNzdWUgOi8NCg0KQXQgbGVh
c3QgeW91IHRlc3RlZCBxdWl0ZSBhIGJ1bmNoIG9mIHRoaW5ncyB3aGljaCBJIHdvdWxkIGhhdmUg
c3VnZ2VzdGVkIA0KYXMgd2VsbC4NCg0KSSB3b3VsZCBhbHNvIHRlc3QgaWYgZGlzYWJsaW5nIHBv
d2VyIGZlYXR1cmVzIGhlbHBzIGFzIHdlbGwsIHRyeSB0byBhZGQgDQphbWRncHUucGdfbWFzaz0w
IGFuZCBhbWRncHUuY2dfbWFzaz0wIHRvIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGZvciANCmV4
YW1wbGUuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gQ2hlZXJzLA0KPg0KPiAgICAg
ICBTeWx2YWluIE11bmF1dA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
