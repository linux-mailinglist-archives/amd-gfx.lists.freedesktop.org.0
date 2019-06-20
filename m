Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7834DC5E
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 23:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261B76E7E3;
	Thu, 20 Jun 2019 21:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D3C6E7E3
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 21:18:16 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3210.namprd12.prod.outlook.com (20.179.105.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 20 Jun 2019 21:18:15 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 21:18:15 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Topic: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Index: AQHVIsotz50EMl3zyE2mDAYgdJl9qqalFcGA
Date: Thu, 20 Jun 2019 21:18:15 +0000
Message-ID: <12aaa938-7517-09d7-b5f9-010331c974db@amd.com>
References: <1560527975-18868-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560527975-18868-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5130e66-b73d-4b65-5217-08d6f5c4ce89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3210; 
x-ms-traffictypediagnostic: DM6PR12MB3210:
x-microsoft-antispam-prvs: <DM6PR12MB3210156479C49827181F982392E40@DM6PR12MB3210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(39860400002)(376002)(396003)(199004)(189003)(8676002)(486006)(31696002)(81156014)(8936002)(66476007)(71190400001)(64756008)(81166006)(66556008)(31686004)(71200400001)(6116002)(316002)(110136005)(36756003)(58126008)(3846002)(66946007)(73956011)(5660300002)(65806001)(65956001)(72206003)(66066001)(64126003)(2906002)(66446008)(256004)(14454004)(6246003)(53936002)(6436002)(25786009)(6512007)(186003)(2616005)(446003)(476003)(11346002)(7736002)(52116002)(102836004)(305945005)(26005)(2501003)(65826007)(76176011)(86362001)(6486002)(99286004)(6506007)(386003)(229853002)(53546011)(68736007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3210;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IGY+tGoqJraL3jArKm2/I51r7SyayepLAX696Q8EkaYZzfhRPaFUgAPZGc6ZBYvz9X4zcn4poGqgf1qWuxvdfyIo7J5SmO44Htgtrbw0t+RoR92sGitlWlle8+W4PRjdIhncY5ZMiN7q0qeAFJ5sy8YXqfpjAbEs7UbCo9Ztfe5+PvAmiwJ3AZQ5xYBgS11iSUI3dObJjreOyOnH2GJ3Rm4kiZZOu9mcNx6IrVtzk8O/8esIef03c+3gRhqf1ZQczO5B3CkXNP7/FweFNTo6M0fhzThszxl+Q2SIivMJHrCt01Q+MWQbvEp7QS5H2rilAvEtBfr2FqfJ/O6ZdYl4kgJUrsXtFCpk9NEFmc6WhzXt7F4kDJPHG1yCvu6F5jo9+DRfPstJy1bgJ9uvbWH8/krCnD52VW+ba1xX6Ivx6w0=
Content-ID: <EC30D484A86A8C4486B5D8DEFD7A14CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5130e66-b73d-4b65-5217-08d6f5c4ce89
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 21:18:15.0293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQXVYDiMJiO8pTAp8BrrIHYgQYP6fT7ROFhp76RIB84=;
 b=OyJiJsC7Fu78UBfuZXgfud9KG4OPbbe5m/GUo4Vg/ugF9UM2wVDyfPQCWfGxdWVcDKMoVVroQ8OSUZ/a5h8MsUT8qUorlsLihtsQnHdJU4sP3EcAq5M2o97syT3mVa7ChsYTClY9VEh+YiRa3fqkBIjc7nF/cQKwcw7wr4/ZPnU=
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

T24gMjAxOS0wNi0xNCAxMTo1OSBhLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IFByZXZpb3VzIGtm
ZCBkb2Vzbid0IHVzZSBnd3Mgc28gdGhpcyBtYXNrIHdhcyBzZXQgdG8gMC4NCj4gU2V0IGl0IHRv
IDY0IGJpdCAxcyBiZWNhdXNlIG5vdyBrZmQgY2FuIHVzZSBhbGwgNjQgZ3dzDQo+IHJlc291cmNl
cy4NCj4NCj4gQ2hhbmdlLUlkOiBJYzgyMTdkNmQxMzUwOTlmMzM5NTAxN2JiYzljMGZlOTRhNzM5
YWE5Mw0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBpbmRleCBlNWM2ZGIxLi4yNTA3OThiIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuYw0KPiBAQCAtOTkzLDggKzk5Myw4IEBAIHN0YXRpYyBpbnQgc2V0X3NjaGVkX3Jl
c291cmNlcyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4gICANCj4gICAJCXJl
cy5xdWV1ZV9tYXNrIHw9ICgxdWxsIDw8IGkpOw0KPiAgIAl9DQo+IC0JcmVzLmd3c19tYXNrID0g
cmVzLm9hY19tYXNrID0gcmVzLmdkc19oZWFwX2Jhc2UgPQ0KPiAtCQkJCQkJcmVzLmdkc19oZWFw
X3NpemUgPSAwOw0KPiArCXJlcy5nd3NfbWFzayA9IDB4RkZGRkZGRkZGRkZGRkZGRjsNCg0KSSB0
aGluayB0aGlzIGlzIGNvcnJlY3QgKGNvdW50aW5nIDE2IEZzKS4gQnV0IGlmIHlvdSB3YW50IHRv
IHNldCBhbGwgNjQgDQpiaXRzLCB+MHVsbCBtYXkgYmUgbGVzcyBlcnJvciBwcm9uZS4NCg0KRWl0
aGVyIHdheSwgdGhpcyBwYXRjaCBpcyBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgDQo8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KPiArCXJlcy5vYWNfbWFzayA9IHJlcy5nZHNfaGVhcF9i
YXNlID0gcmVzLmdkc19oZWFwX3NpemUgPSAwOw0KPiAgIA0KPiAgIAlwcl9kZWJ1ZygiU2NoZWR1
bGluZyByZXNvdXJjZXM6XG4iDQo+ICAgCQkJInZtaWQgbWFzazogMHglOFhcbiINCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
