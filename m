Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1E4F08E
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 23:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DE06E92D;
	Fri, 21 Jun 2019 21:49:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690051.outbound.protection.outlook.com [40.107.69.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776D6E92D
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 21:49:30 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2857.namprd12.prod.outlook.com (20.179.71.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 21:49:28 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.2008.014; Fri, 21 Jun 2019
 21:49:28 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: drop unused df init callback
Thread-Topic: [PATCH] drm/amdgpu: drop unused df init callback
Thread-Index: AQHVKHj6GL/qF3Xk0Eq8gxGO2kM3DaampXKA
Date: Fri, 21 Jun 2019 21:49:28 +0000
Message-ID: <34c4a8b1-6973-d41a-e74a-3c7f8e065695@amd.com>
References: <20190621213320.31205-1-alexander.deucher@amd.com>
In-Reply-To: <20190621213320.31205-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTOPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::16) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d536ac38-579e-4287-443b-08d6f69255bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2857; 
x-ms-traffictypediagnostic: DM6PR12MB2857:
x-microsoft-antispam-prvs: <DM6PR12MB2857077F311DAD36781184F492E70@DM6PR12MB2857.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(366004)(136003)(396003)(346002)(189003)(199004)(102836004)(14444005)(8676002)(72206003)(64126003)(256004)(65826007)(6512007)(36756003)(7736002)(26005)(71200400001)(6436002)(4744005)(71190400001)(11346002)(110136005)(476003)(305945005)(58126008)(446003)(316002)(2616005)(486006)(31696002)(3846002)(53546011)(66946007)(2501003)(68736007)(53936002)(66476007)(31686004)(186003)(64756008)(5660300002)(66556008)(52116002)(99286004)(6116002)(66446008)(73956011)(386003)(2906002)(65806001)(4326008)(25786009)(6486002)(66066001)(65956001)(14454004)(478600001)(81166006)(8936002)(229853002)(81156014)(6246003)(76176011)(6506007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2857;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vUKTN13L656n03mA6A+NJd83NRX+X+I9KTUZwlRvahFMfnUfVUB5JyM6/OEXDa46oklm11EP5rszj10HYexvCkRSmjio0Ebi3Q+c/KYdqGk2CyCgIA2xldQx8FlQjTJDl4At53LwD1P5b5Kqp6nj93YUfZruBQRtm8iwM6sdqkcDPCWTugikcwSipR+z612ztnc8RXztZEKUKuIHXaqJ32KH03cnNqHLF6BsfIeFFIAGg0xpuRatBuvgfQubBoGztxjcHV0WJIv7ja+0nzhkqcp1DvOnVGOOOaqA7ydLYaKIxUjJ7aP/iK41u5A3L4pQqpYWEGN0CjbQJ6Jf8juW4GnCA96MJdrshWjMcu+pmz8pVuwMY67/+1BQ1UGT37L+RMNGv05+fE+byghcvVICWjZAosnOr9RekMLn65Rcod0=
Content-ID: <DEA72099CFF8D441BF7CA8410D17C776@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d536ac38-579e-4287-443b-08d6f69255bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 21:49:28.6647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2857
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJj3OVd2PULJsIaKvNe1yaHsgOnmoS66k+/g2V+PkIE=;
 b=LVptILLvYdi8NH6gTdElvJUFvUgEVfcg1y/Y6HidcneyTBmMZqIYdqmWXBzPK6YuJgVERf0Ezm0IZPMjexm7IgF5M1KhaLwz7cQYaA9jV5gprZ9LFAd1ql8/Wc94Fntr5XbfrK+u2gB7Rxfltpj02FGVmANa8LRC3Qf3oLi3WHY=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSA1OjMzIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gSXQgd2FzIHJl
cGxhY2VkIHdpdGggdGhlIHN3X2luaXQgY2FsbGJhY2sgc28gaXMgbm8gbG9uZ2VyDQo+IG5lZWRl
ZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDEg
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oDQo+IGluZGV4IDcxMThjYTIxYWE0ZS4uODk2YTRiYzYwMDQwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiBAQCAtNjg3LDcgKzY4Nyw2IEBA
IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyB7DQo+ICAgfTsNCj4gICANCj4gICBzdHJ1Y3QgYW1k
Z3B1X2RmX2Z1bmNzIHsNCj4gLQl2b2lkICgqaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOw0KPiAgIAl2b2lkICgqc3dfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0K
PiAgIAl2b2lkICgqZW5hYmxlX2Jyb2FkY2FzdF9tb2RlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwNCj4gICAJCQkJICAgICAgYm9vbCBlbmFibGUpOw0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
