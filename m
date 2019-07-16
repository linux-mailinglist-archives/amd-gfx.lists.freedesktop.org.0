Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556846B19B
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 00:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B06E1B3;
	Tue, 16 Jul 2019 22:10:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F996E1B3
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 22:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwgpbAcFhh1JP1cq0kwws1gHndvzBgfde6zV7pzaXr8KVW9Z7fSVk41ktNlLa3Kg2RVEZ5dhk65e+L4I+BrUARMhYSdiCWrJ/H7iHbevoJcVODwDJRdqgd/NGvyteuB8v44/lCCe0cbwGZjMING1QDriI2yaAwGaDEsqZtUZz+6PqTABNdh/4Bj0Ah+fBccGz04CXcLhGWZbXhyivn51aULzcicoOn9l12YbwJd58L8sbuYAWP7GsC8GcQ/wDtlx0LE6cl/EXYC3HM+HWfdGaXJTgKkij8QQsczmut4fy2Yg+9wbQSmzD8zDFHaiBcp2ZXTzVcvtcLb+duza1HFqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwc19l73bnfCAH5dOKzDgVL0clT9vivmFMfRoF/ZCcw=;
 b=TkmX+nmHfJOwAbWIoM2SG8UPg3bcQ/3PoaN9N0tZYZRnEgn2ernOEOO3frcgMAQPJmlsyXibQmj+DWwNaT2EYQkWim2CTha7Je8SBf+1xNygNu2531C15f+cla32wpfmEkJECg/q35S+eFVuqOBzm5bAPmQsNEodUsXUuCGBggJUEjSftGv7J3rAa9hoqY55WOMOekvJbjqpbOZqqPTlAFPCD0pdu3v9okE6GUTmajAm+2RRhxWKs4cMD5kGD165OQ7ylLtyo6G0NmcLip9uDeGiq4lOQ34c1SnRHaVCWDw6AD6bE18huDVUausHom8wH2VD+Lv40WBIXYVYa+bL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3756.namprd12.prod.outlook.com (10.255.172.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 22:10:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 22:10:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Jason Gunthorpe
 <jgg@mellanox.com>
Subject: Re: HMM related use-after-free with amdgpu
Thread-Topic: HMM related use-after-free with amdgpu
Thread-Index: AQHVOy2DhhPiqe7uNk2TzH3Qj8n9cqbL7jOAgAGDMICAAAFPAIAACB0AgABVd4A=
Date: Tue, 16 Jul 2019 22:10:46 +0000
Message-ID: <7b5daece-10ea-e96e-5e75-f6fa4e589d5e@amd.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
 <20190716163545.GF29741@mellanox.com>
 <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
In-Reply-To: <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8199250c-e41a-465a-fc60-08d70a3a73f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3756; 
x-ms-traffictypediagnostic: DM6PR12MB3756:
x-microsoft-antispam-prvs: <DM6PR12MB3756AA098EA28CCBA392E80292CE0@DM6PR12MB3756.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(386003)(5660300002)(53936002)(6506007)(71190400001)(71200400001)(86362001)(53546011)(6246003)(6486002)(66066001)(65956001)(65806001)(14454004)(31696002)(25786009)(6436002)(6512007)(8676002)(64126003)(76176011)(305945005)(7736002)(4326008)(66476007)(66556008)(64756008)(99286004)(66946007)(446003)(66446008)(52116002)(36756003)(2906002)(478600001)(58126008)(110136005)(186003)(68736007)(229853002)(65826007)(31686004)(8936002)(6116002)(3846002)(26005)(54906003)(486006)(316002)(5024004)(81166006)(2616005)(102836004)(256004)(476003)(81156014)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3756;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +vhbptYAscEHlytnY3py4jA+glB15rbvHQ9318lHpzFmTZRVGZVJuSXvdb4P9E28eGkbFfO941kVPem7gLF20q5natqD/BKR5MMl0a1/XfaoKeQesNO0UQFkTAhVMhCHMQF/ESPQzIHg0mrrhNWttxOBaWb+nlDGrEzxfw4f9NyzJOHNAqjRX/iru0U1faiAPXh7xOZMAaOkHbBBc6vqsmbmSxXM2lzgD3nmvENszhu7XVyOiClZipiTmxapY4c3mrTCM37bH6aKag4pvOn5YJM3nPxnGm2TdoTwMrnDygValtUi6o5ttbz1Dakl+Cspizyy5Cm5vig2X+3aTTAyRSBDXmCR5eubwxvgR2yzZGt/27SnXmEnfQr0Q2JVyGAVE8GoWzRGT/YcIBd9+l2jePUkvgWaSkZemYb6vy+v+C4=
Content-ID: <9AE7743805FF0E418D9F5F8DF971347A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8199250c-e41a-465a-fc60-08d70a3a73f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 22:10:46.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3756
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwc19l73bnfCAH5dOKzDgVL0clT9vivmFMfRoF/ZCcw=;
 b=aoX+b/jKrVMHUPycx70KQMavLfNXY6ZApzaFC/ORKr4qPwNIoaLiDeR5zEXtvSjuURhNDL4WeZZwE67d//LrfroBUez2TcE8Fq/rB2RPY/zJow/IGTeblTxGzCiyAnaGgBtOYVPn7SIKQjDrliy575oIv+vAa/CAsKgLrkqr7b0=
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xNiAxOjA0IHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiBPbiAyMDE5
LTA3LTE2IDY6MzUgcC5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPj4gT24gVHVlLCBKdWwg
MTYsIDIwMTkgYXQgMDY6MzE6MDlQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6DQo+Pj4g
T24gMjAxOS0wNy0xNSA3OjI1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4+Pj4gT24g
TW9uLCBKdWwgMTUsIDIwMTkgYXQgMDY6NTE6MDZQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3Jv
dGU6DQo+Pj4+PiBXaXRoIGEgS0FTQU4gZW5hYmxlZCBrZXJuZWwgYnVpbHQgZnJvbSBhbWQtc3Rh
Z2luZy1kcm0tbmV4dCwgdGhlDQo+Pj4+PiBhdHRhY2hlZCB1c2UtYWZ0ZXItZnJlZSBpcyBwcmV0
dHkgcmVsaWFibHkgZGV0ZWN0ZWQgZHVyaW5nIGEgcGlnbGl0IGdwdSBydW4uDQo+Pj4+IERvZXMg
dGhpcyBicmFuY2ggeW91IGFyZSB0ZXN0aW5nIGhhdmUgdGhlIGhtbS5naXQgbWVyZ2VkPyBJIHRo
aW5rIGZyb20NCj4+Pj4gdGhlIG5hbWUgaXQgZG9lcyBub3Q/DQo+Pj4gSW5kZWVkLCBuby4NCj4+
Pg0KPj4+DQo+Pj4+IFVzZSBhZnRlciBmcmVlJ3Mgb2YgdGhpcyBuYXR1cmUgd2VyZSBzb21ldGhp
bmcgdGhhdCB3YXMgZml4ZWQgaW4NCj4+Pj4gaG1tLmdpdC4uDQo+Pj4+DQo+Pj4+IEkgZG9uJ3Qg
c2VlIGFuIG9idmlvdXMgd2F5IHlvdSBjYW4gaGl0IHNvbWV0aGluZyBsaWtlIHRoaXMgd2l0aCB0
aGUNCj4+Pj4gbmV3IGNvZGUgYXJyYW5nZW1lbnQuLg0KPj4+IEkgdHJpZWQgbWVyZ2luZyB0aGUg
aG1tLWRldm1lbS1jbGVhbnVwLjQgY2hhbmdlc1swXSBpbnRvIG15IDUuMi55ICsNCj4+PiBkcm0t
bmV4dCBmb3IgNS4zIGtlcm5lbC4gV2hpbGUgdGhlIHJlc3VsdCBkaWRuJ3QgaGl0IHRoZSBwcm9i
bGVtLCBhbGwNCj4+PiBHTF9BTURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMgZmFpbGVkLCBz
byBJIHN1c3BlY3QgdGhlIHByb2JsZW0gd2FzDQo+Pj4gc2ltcGx5IGF2b2lkZWQgYnkgbm90IGFj
dHVhbGx5IGhpdHRpbmcgdGhlIEhNTSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuDQo+Pj4NCj4+PiBJ
dCdzIHBvc3NpYmxlIHRoYXQgSSBtYWRlIGEgbWlzdGFrZSBpbiBtZXJnaW5nIHRoZSBjaGFuZ2Vz
LCBvciB0aGF0IEkNCj4+PiBtaXNzZWQgc29tZSBvdGhlciByZXF1aXJlZCBjaGFuZ2VzLiBCdXQg
aXQncyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIEhNTQ0KPj4+IGNoYW5nZXMgYnJva2UgdGhlIGNv
cnJlc3BvbmRpbmcgdXNlci1wb2ludGVyIGZ1bmN0aW9uYWxpdHkgaW4gYW1kZ3B1Lg0KPj4gTm90
IHN1cmUsIHRoaXMgd2FzIGFsbCBUZXN0ZWQgYnkgdGhlIEFNRCB0ZWFtIHNvIGl0IHNob3VsZCB3
b3JrLCBJDQo+PiBob3BlLg0KPiBJdCBjYW4ndCwgZHVlIHRvIHRoZSBpc3N1ZSBwb2ludGVkIG91
dCBieSBMaW51cyBpbiB0aGUgImRybSBwdWxsIGZvcg0KPiA1LjMtcmMxIiB0aHJlYWQ6IERSTV9B
TURHUFVfVVNFUlBUUiBzdGlsbCBkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTSwgd2hpY2gNCj4gbm8g
bG9uZ2VyIGV4aXN0cywgc28gaXQgY2FuJ3QgYmUgZW5hYmxlZC4NCg0KQXMgZmFyIGFzIEkgY2Fu
IHRlbGwsIExpbnVzIGZpeGVkIHRoaXMgdXAgaW4gaGlzIG1lcmdlIGNvbW1pdCANCmJlODQ1NGFm
YzUwZjQzMDE2Y2E4YjYxMzBkOTY3M2JkZDBiZDU2ZWMuIEphc29uLCBpcyBobW0uZ2l0IGdvaW5n
IHRvIGdldCANCnJlYmFzZWQgb3IgbWVyZ2UgdG8gcGljayB1cCB0aGUgYW1kZ3B1IGNoYW5nZXMg
Zm9yIEhNTSBmcm9tIG1hc3Rlcj8NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4gRml4
aW5nIHRoYXQgdXAgbWFudWFsbHksIGl0IHN1Y2Nlc3NmdWxseSBmaW5pc2hlZCBhIHBpZ2xpdCBy
dW4gd2l0aCB0aGF0DQo+IGZ1bmN0aW9uYWxpdHkgZW5hYmxlZCBhcyB3ZWxsLg0KPg0KPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
