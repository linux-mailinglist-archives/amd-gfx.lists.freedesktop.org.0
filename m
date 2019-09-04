Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A53A9716
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 01:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2776A89C69;
	Wed,  4 Sep 2019 23:28:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D747789C69
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 23:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpjIeIqPUpzwq/xZku0kcmUN74y+BIy68iZEimxP9ZjgnXUFA8f2YYUT4pb3oFZKkBn35vRXUPOhbjnbmhAMePf++ZrgVh5YzJrisrqzCGgFSvHHwU/SH5sqhqxCZ8jGgbU1OxlT/ThKFpv4oWypfm4Vm+cONfpPlzpk98886TfvLXqDTs2XpiMG1P5L/5E4kWPf/gkvsG0rdIg3dMv9zUBjxiajwOFrub5bw2k1xk/lJ5iyg/JEIQVYflHktJ/YlBRcbj1Kg/LRIr/F7Hn9KQWDiwWupv58TVoqw6fdhxMy4dWmfhsTP24kFloKa9icrXj695kBTZmxtcyVPERMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnHjtNtGALmafpoi9u+f4nWaBvtvWKGclCvYKWl/Qdk=;
 b=SDl9Y47EDJOYLTVzCpAHCopPxK7LCWIrf2F8UPBldZHzAh3Z28DtFzKB2ZhqbJzzMnpOl1YgTWXI4kIazC4ZBywDhccCDYK82Ax7nrpo/kEhCPFC1uxvt2AIK8iuxTIEWHFSBPh4opcfPcMXk0JlKIuaQbS9Z+LyrjvGsAhucxpum0qbpJ3HBxM9NUD+vIWOcdnbNmbsqDThKm5Z+4v7XH86qqsmyKwDt72zVKhKu/hD7lawOHfhrwbbmfx1dooY4wVOBLmit89GlACesjwtecJpBMGhK+PuGpZI2D/SzGRMghFOXT1uyI5ZisSvudVWOJ96o66UpJXDafS50E91wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3689.namprd12.prod.outlook.com (10.255.76.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Wed, 4 Sep 2019 23:28:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 23:28:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Graceful page fault handling for Vega/Navi
Thread-Topic: Graceful page fault handling for Vega/Navi
Thread-Index: AQHVYzHNJ7LzOp8+Bk6tUzuCle68FaccI4kAgAAHAwA=
Date: Wed, 4 Sep 2019 23:28:36 +0000
Message-ID: <b25d6cc4-b18c-4c2a-a4f9-a2b9f51eddb6@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <MN2PR12MB3309C53565E6D4E2E9FE23C7ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309C53565E6D4E2E9FE23C7ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11da8a26-a30e-46c6-0234-08d7318f9c00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3689; 
x-ms-traffictypediagnostic: DM6PR12MB3689:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3689F46E6C1F58CB9ABB989F92B80@DM6PR12MB3689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(53754006)(189003)(66574012)(31686004)(102836004)(36756003)(11346002)(2616005)(476003)(81156014)(81166006)(229853002)(65806001)(65956001)(66066001)(316002)(966005)(6486002)(6506007)(386003)(25786009)(53546011)(5660300002)(14454004)(486006)(76176011)(446003)(66946007)(66556008)(64756008)(66476007)(66446008)(478600001)(26005)(4326008)(3846002)(7736002)(58126008)(2906002)(86362001)(6116002)(8936002)(31696002)(305945005)(256004)(186003)(14444005)(6306002)(6512007)(6246003)(53936002)(6436002)(99286004)(52116002)(110136005)(71200400001)(71190400001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3689;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uQd2LtfiYhmrf0ADzcl8RQ1Aq8Zw1qnu4a5+tqFY163Ppg4zngK1hn8e5yEBjrJ4KZ+we110iooZHmVaFArma3SgSIWcQQlntS9qN79Gsr1wf7PRlgCTFHQ6xQvKr9Ygn67IOBBNAcbuaVVIRDBn0lFmeLdzsvkGP7lKhgEEr5wtobiF+qj7g21rbVeY2kgUNaghRRTOJ39eo406MC/TwZxQnR4AAbNKlx34Jpq9Y9J0RrInu8J8JpqiloOhTTPXWf8xmhw5XlVMl1CCjeBzhylj0hocn4c5tbF+TtF91f++x07wZy9/k084R3WKNgIs15M/pbYcBoK3vTAKlc5m2CA05/cQ9pdkRN8iwRFqx69+j109rnmL09crcFzNCxSg6HqsM0zWWBaATP1lY1F05Fbfl+u1rjchgQsMEnxDakA=
Content-ID: <FEFF765C60355C4CAC3720BB04F821CC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11da8a26-a30e-46c6-0234-08d7318f9c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 23:28:36.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KD4ddYt350k/vYm8QE+YnHlzYoTcLjLyW0oLXBW2VNa/HzGubhCcTIcFB6JWd3FtfCsYTFFkmoRprgHYDdZXFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3689
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnHjtNtGALmafpoi9u+f4nWaBvtvWKGclCvYKWl/Qdk=;
 b=pdqcdQwb7dfiW+7w8+kvy1QjYlVnBIAQDCNQQzy1pk+mJa29KMgv/ITwexnangXaSRRrjFpfZf4LO9OL4QVBujdfk4wh+TwNNuY0bETukF/6Df48Yw2UycsMrJX6IN02sQJWjtzUO6Wo8MJdRUXjU1ILiTNM+kOKD4HICTRTUOk=
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

T24gMjAxOS0wOS0wNCA3OjAzIHAubS4sIEh1YW5nLCBSYXkgd3JvdGU6DQo+IE9uIFdlZCwgU2Vw
IDA0LCAyMDE5IGF0IDA1OjAyOjIxUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+
PiBIaSBldmVyeW9uZSwNCj4+DQo+PiB0aGlzIHNlcmllcyBpcyB0aGUgbmV4dCBwdXp6bGUgcGll
Y2UgZm9yIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQgaGFuZGxpbmcgb24gVmVnYSBhbmQgTmF2aS4N
Cj4+DQo+PiBJdCBhZGRzIGEgbmV3IGRpcmVjdCBzY2hlZHVsZXIgZW50aXR5IGZvciBWTSB1cGRh
dGVzIHdoaWNoIGlzIHRoZW4gdXNlZCB0byB1cGRhdGUgcGFnZSB0YWJsZXMgZHVyaW5nIGEgZmF1
bHQuDQo+Pg0KPj4gSW4gb3RoZXIgd29yZHMgcHJldmlvdXNseSBhbiBhcHBsaWNhdGlvbiBkb2lu
ZyBhbiBpbnZhbGlkIG1lbW9yeSBhY2Nlc3Mgd291bGQganVzdCBoYW5nIGFuZC9vciByZXBlYXQg
dGhlIGludmFsaWQgYWNjZXNzIG92ZXIgYW5kIG92ZXIgYWdhaW4uIE5vdyB0aGUgaGFuZGxpbmcg
aXMgbW9kaWZpZWQgc28gdGhhdCB0aGUgaW52YWxpZCBtZW1vcnkgYWNjZXNzIGlzIHJlZGlyZWN0
ZWQgdG8gdGhlIGR1bW15IHBhZ2UuDQo+Pg0KPj4gVGhpcyBuZWVkcyB0aGUgZm9sbG93aW5nIHBy
ZXJlcXVpc2l0ZXM6DQo+PiBhKSBUaGUgZmlybXdhcmUgbXVzdCBiZSBuZXcgZW5vdWdoIHNvIGFs
bG93IHJlLXJvdXRpbmcgb2YgcGFnZSBmYXVsdHMuDQo+PiBiKSBGYXVsdCByZXRyeSBtdXN0IGJl
IGVuYWJsZWQgdXNpbmcgdGhlIGFtZGdwdS5ub3JldHJ5PTAgcGFyYW1ldGVyLg0KPiBJbiBteSBz
aWRlLCBJIGZvdW5kICJub3RyZXRyeSIgcGFyYW1ldGVyIG5vdCB3b3JrYWJsZSBmb3Igdm1pZCAw
IHZtIGZhdWx0cy4NCj4gSWYgdGhlIHNhbWUgb2JzZXJ2YXRpb24gaW4geW91ciBzaWRlLCBJJ2Qg
bGlrZSBnaXZlIGEgY2hlY2suDQoNCkkgdGhpbmsgdGhlIG5vcmV0cnkgcGFyYW1ldGVyIGlzIG5v
dCBtZWFudCB0byBhZmZlY3QgVk1JRDAuIEkganVzdCBmaW5kIA0KaXQgc3VycHJpc2luZyB0aGF0
IHJldHJ5IGZhdWx0cyBhcmUgaGFwcGVuaW5nIGF0IGFsbCBvbiBWTUlEMC4gSXQgDQpkb2Vzbid0
IG1ha2UgYSBsb3Qgb2Ygc2Vuc2UuIEkgY2FuJ3QgdGhpbmsgb2YgYW55IGdvb2QgcmVhc29uIHRv
IHJldHJ5IA0KYW55IHBhZ2UgZmF1bHRzIGluIFZNSUQwLg0KDQpJIHNlZSB0aGF0IHRoZSBIVyBk
ZWZhdWx0IGZvciB0aGUgUkVUUllfUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFVTFQgDQpi
aXQgaXMgMSBpbiBWTV9DT05URVhUMF9DTlRMLiBJIGRvbid0IHNlZSB1cyBjaGFuZ2luZyB0aGF0
IHZhbHVlIGluIHRoZSANCmRyaXZlci4gV2UgcHJvYmFibHkgc2hvdWxkLiBJJ2xsIHNlbmQgb3V0
IGEgcGF0Y2ggZm9yIHRoYXQuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+IFRoYW5r
cywNCj4gUmF5DQo+DQo+DQo+PiBjKSBFbm91Z2ggZnJlZSBWUkFNIHRvIGFsbG9jYXRlIHBhZ2Ug
dGFibGVzIHRvIHBvaW50IHRvIHRoZSBkdW1teSBwYWdlLg0KPj4NCj4+IFRoZSByZS1yb3V0aW5n
IG9mIHBhZ2UgZmF1bHRzIGN1cnJlbnQgb25seSB3b3JrcyBvbiBWZWdhMTAsIHNvIFZlZ2EyMCBh
bmQgTmF2aSB3aWxsIHN0aWxsIG5lZWQgc29tZSBtb3JlIHRpbWUuDQo+Pg0KPj4gUGxlYXNlIHJl
dmlldyBhbmQvb3IgY29tbWVudCwNCj4+IENocmlzdGlhbi4NCj4+DQo+Pg0KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBs
aXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
