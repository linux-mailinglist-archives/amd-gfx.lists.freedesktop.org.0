Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F263BDE
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 21:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C962894B7;
	Tue,  9 Jul 2019 19:26:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6B5894B7
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 19:26:30 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 19:26:28 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 19:26:28 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: Intermittent errors when using amdgpu_job_submit_direct
Thread-Topic: Intermittent errors when using amdgpu_job_submit_direct
Thread-Index: AQHVNhJBsDnJQXPLAkeGgQebgEnuI6bCP7YAgABsjYA=
Date: Tue, 9 Jul 2019 19:26:28 +0000
Message-ID: <bcaf471b-bc25-02c0-4547-b756bbf42bf6@amd.com>
References: <885956af-be59-d218-f2e7-a0fc06042f21@amd.com>
 <affc1656-4696-846e-baca-48331aef3043@amd.com>
In-Reply-To: <affc1656-4696-846e-baca-48331aef3043@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5755568-bc37-4987-6dbd-08d704a35710
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3947; 
x-ms-traffictypediagnostic: DM6PR12MB3947:
x-microsoft-antispam-prvs: <DM6PR12MB3947C087DB268FAA5C27BBBF92F10@DM6PR12MB3947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(8676002)(81166006)(5660300002)(256004)(8936002)(31686004)(305945005)(7736002)(478600001)(81156014)(3846002)(65826007)(2906002)(72206003)(6116002)(71200400001)(6512007)(53936002)(76176011)(6436002)(58126008)(65806001)(66066001)(65956001)(71190400001)(316002)(52116002)(53546011)(6506007)(386003)(66946007)(99286004)(73956011)(68736007)(186003)(229853002)(2616005)(446003)(11346002)(26005)(66556008)(110136005)(6246003)(476003)(6486002)(31696002)(25786009)(86362001)(486006)(36756003)(14454004)(64756008)(102836004)(66476007)(64126003)(2501003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3947;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sgUKUgr2BYvm5QCQIizNEZJ+NHkJfy3y7C8ZbmEEG6sN+ap8OAeARt9KjYxEDftRX6ROpKrMDqekNm8L4fONVwOTfnumGTuEQ/Uqp6PyRcG3pdGrjRKMUlYGmD6RptQZaaWImDNjDD0e66VmyCSIKhFtDiepqpj1GjV+VreXWvMX3+5jwikMJH/a+FkmqqavATCHGSl9qaFSDGhHwLD3+Sc5OP8rU+/2tvnKRAGM62E6b6lU3r8Akgkaxs+mRYlkXjgkz1Z7+8/2GBQ5xjtZ+eOxXBKBPBu+CBes8D8rWcUEwVCFJURRfVE1wUubLww0c0/VIzD/j1CyLTo0ihMN5tVP3bCsH4cWKyZWxRrzIVrP+Mt3Hszs3LVHY9zz9rWyV6Kt0yXJ/ABoOijW7KF5DFB6Vho5atwKmEa3jMaBax8=
Content-ID: <E3ACC5E1B888F840A06CB547EE5BDA0F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5755568-bc37-4987-6dbd-08d704a35710
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 19:26:28.5108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q29M/N83wrXhpbUV4kmRxGrZNskaKpKiQT+yKI/994A=;
 b=v86pJRpCfiXL1s1y7MxlrmrGQ4TQiHK/y5gR62FMQ/qwXoRdpWRiJLCd9IiNj+Kxo7zYQjs5l+HHkyfFPU5AAdVbE0t4yQBeszgWEKnpOzSOQHOPDM9YNwZY9D2FjFjwzm5dQIL0sIhnhXIx9iUqSdOQAkfeYZFt8Au92rdnWUk=
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

T24gMjAxOS0wNy0wOSA4OjU4IGEubS4sIFpob3UsIERhdmlkKENodW5NaW5nKSB3cm90ZToNCj4g
SSd2ZSByYWlzZWQgaXQgdXAgd2hlbiBDaHJpc3RpYW4gbWFrZSBwYWdlIGZhdWx0LCBhdCB0aGF0
IHBhdGNoLA0KPiBhbWRncHVfam9iX3N1Ym1pdF9kaXJlY3QgdXNlcyBleGNsdXNpdmUgcGFnZSBm
YXVsdCByaW5nIGZvciB0aGF0Lg0KPg0KPiBCdXQgaWYgeW91IHVzZSBhbWRncHVfam9iX3N1Ym1p
dF9kaXJlY3QgZm9yIGdlcm5lcmFsIHJpbmdzIG9jdXBwaWVkIGJ5DQo+IHNjaGVkdWxlciwgSSBn
dWVzcyB2YXJpYXMgYnVncyB3aWxsIGhhcHBlbi4NCg0KVGhlIHByb2JsZW0gaXMsIGV2ZW4gdGhl
IHBhZ2luZyByaW5nIGlzIHVzZWQgYnkgdGhlIHNjaGVkdWxlci4gVGhlcmUgYXJlIA0Kc2V2ZXJh
bCBwbGFjZXMgd2hlcmUgYnVmZmVyIG9wZXJhdGlvbnMgYXJlIHN1Ym1pdHRlZCB0byB0aGUgcGFn
aW5nIHJpbmcgDQp0aHJvdWdoIHRoZSBzY2hlZHVsZXIuIFRoYXQgbWFrZXMgYW55IHVzZSBvZiB0
aGUgcGFnaW5nIHJpbmcgdGhyb3VnaCANCmRpcmVjdCBzdWJtaXNzaW9uIHByb2JsZW1hdGljLg0K
DQpFdmVuIGlnbm9yaW5nIHRoZSBzY2hlZHVsZXIsIGlmIGl0J3MgcG9zc2libGUgdGhhdCBtdWx0
aXBsZSB0aHJlYWRzIA0Kc3VibWl0IHRvIHRoZSBwYWdpbmcgcmluZywgd2UnbGwgbmVlZCBsb2Nr
aW5nIHRvIGVuc3VyZSB0aGF0IHRoZSANCmNvbnRlbnRzIG9mIHRoZSByaW5nIHJlbWFpbiBjb25z
aXN0ZW50LiBJSVJDLCB0aGUgcmluZ3MgdXNlZCB0byBoYXZlIA0KbG9ja2luZyBiZWZvcmUgd2Ug
aGFkIGEgR1BVIHNjaGVkdWxlci4gRm9yIGNvbXBhcmlzb24sIHNlZSANCnJhZGVvbl9yaW5nLmMs
IHdoaWNoIHN0aWxsIGhhcyBsb2NraW5nLiBXaXRoIHRoZSBHUFUgc2NoZWR1bGVyLCB0aGUgDQpy
aW5ncyBiZWNhbWUgc2luZ2xlLXByb2R1Y2VyIHF1ZXVlcyB0aGF0IG5vIGxvbmdlciBuZWVkZWQg
bG9ja2luZy4gQnV0IA0Kd2l0aCBkaXJlY3Qgc3VibWlzc2lvbiB0aGF0IGlzIG5vIGxvbmdlciB0
cnVlLiBJIHRoaW5rIGEgZ29vZCBwbGFjZSB0byANCmRvIHRoYXQgbG9ja2luZyBub3cgd291bGQg
YmUgaW4gYW1kZ3B1X2liX3NjaGVkdWxlLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPg0K
PiAtRGF2aWQNCj4NCj4g5ZyoIDIwMTkvNy85IDEyOjUzLCBLdWVobGluZywgRmVsaXgg5YaZ6YGT
Og0KPj4gSSdtIHNlZWluZyBzb21lIHdlaXJkIGludGVybWl0dGVudCBidWdzICh2bSBmYXVsdHMs
IGhhbmdzLCBldGMpIHdoZW4NCj4+IHRyeWluZyB0byB1c2UgYW1kZ3B1X2pvYl9zdWJtaXRfZGly
ZWN0LiBJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzIGENCj4+IHBvc3NpYmlsaXR5IG9mIGEgcmFj
ZSBjb25kaXRpb24sIHdoZW4gYSBzdWJtaXRfZGlyZWN0IGFuZCBhIEdQVQ0KPj4gc2NoZWR1bGVy
IHRocmVhZCB0cnkgdG8gc3VibWl0IHRvIHRoZSBzYW1lIHJpbmcgYXQgdGhlIHNhbWUgdGltZS4g
SQ0KPj4gZGlkbid0IHNlZSBhbnkgbG9ja2luZyB0byBhbGxvdyBtdWx0aXBsZSB0aHJlYWRzIHNh
ZmVseSBzdWJtaXR0aW5nIHRvDQo+PiB0aGUgc2FtZSByaW5nLg0KPj4NCj4+IEFtIEkgbWlzc2lu
ZyBzb21ldGhpbmc/DQo+Pg0KPj4gVGhhbmtzLA0KPj4gICAgwqAgRmVsaXgNCj4+DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
