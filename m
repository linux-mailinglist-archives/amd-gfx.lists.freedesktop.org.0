Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C20350B2
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 22:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABEE89715;
	Tue,  4 Jun 2019 20:12:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780070.outbound.protection.outlook.com [40.107.78.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50E689715
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 20:12:26 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3195.namprd12.prod.outlook.com (20.179.105.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 20:12:25 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 4 Jun 2019
 20:12:25 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] KFD upstreaming
Thread-Topic: [PATCH 0/3] KFD upstreaming
Thread-Index: AQHVFaYW50z+q2Kp5UWxtAs9xJtre6aL+FeA
Date: Tue, 4 Jun 2019 20:12:25 +0000
Message-ID: <a16cf042-fcb9-21a7-20e4-20c61174f3ff@amd.com>
References: <20190528223811.13947-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190528223811.13947-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d58d6ede-9d97-4716-f065-08d6e928f5b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3195; 
x-ms-traffictypediagnostic: DM6PR12MB3195:
x-microsoft-antispam-prvs: <DM6PR12MB319522F6FEBA19FA55B6B86B92150@DM6PR12MB3195.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(396003)(366004)(39860400002)(189003)(199004)(2351001)(66066001)(65806001)(68736007)(14454004)(229853002)(2906002)(65956001)(6116002)(305945005)(186003)(3846002)(6486002)(6512007)(478600001)(5640700003)(2501003)(7736002)(58126008)(476003)(6436002)(486006)(66446008)(66476007)(36756003)(81166006)(81156014)(8936002)(6916009)(73956011)(66946007)(11346002)(64126003)(53936002)(53546011)(8676002)(71200400001)(71190400001)(76176011)(256004)(99286004)(5660300002)(386003)(6506007)(86362001)(66556008)(64756008)(31696002)(52116002)(25786009)(102836004)(26005)(65826007)(72206003)(316002)(2616005)(6246003)(446003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3195;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HRzW4Qz7WwEIu9HZKSuzFHCouk8NufR4lTVh3whMkC0qtlJQyfXKKs2dBArkN9syRuLgmxWiN/V8hXwuqPxGiG7ka1OLXUeVluzChV/TNDGjwLkfEeK6EWq8voWPylH6YkiYcP7IZgcGpVyzte3dd4XbkYurItM+yP7gdM5+FPeBnpOmpSCfgreR7sDZa5XgmTJLbxd1FpUwpzVLdrPytzr3eoZhEslyN3morpl2G2QwHQ4i5xnxn8HmEA/z9Z7bqI3K9TVEuHYVmgdV2+hZboJmCJf21SSx0ftWB4GS4E9bkcZyFgvFbAdNIGBuGazzgCOaQfE956Iv1Zh91S2+OfJdtQL8NmxQGz8n4G3/J7C8n3jelASI33/f8OJAVQOJb9Lcy20nOCQ/halCRHsWfVZeLkmd8yrTpRRZ2mOsVro=
Content-ID: <93D36765A5EDC74B993B40471427774F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58d6ede-9d97-4716-f065-08d6e928f5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 20:12:25.4030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3195
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOSXGykoS3smpGhlW9Y2P6dwQvRV6r1xmG+C2k+c2O4=;
 b=xtjvND6kSkprjAiRa8jjz7jG7t/txUKA12R0ISNxzhm4wcZwinHTLMeDERHhU74KxoL93oeCBYstJ0j5J9zzTPeUsuKFJ4mhSUF+PRRIKcPJIwVUfBOic93YtFY6e1GYIqjEc4sWYz691r81PsjYEaCTGFdIJtsr1bLHh4gqTdA=
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

VGhlcmUgaGF2ZW4ndCBiZWVuIGFueSBvYmplY3Rpb25zIHRvIHRoZXNlIGNoYW5nZXMuIERvZXMg
YW55b25lIHdhbnQgdG8gDQphZGQgdGhlaXIgQWNrZWQtYnkgYmVmb3JlIEkgc3VibWl0Pw0KDQpU
aGFua3MsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNS0yOCAxODozOCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOg0KPiBOZXcgZmVhdHVyZTogcXVldWUgcHJpb3JpdGllcw0KPg0KPiBUaGUgZXZpY3Rp
b24gc3RhdGUgbG9naWMgY2hhbmdlIGlzIHByZXBhcmF0aW9uIGZvciBzb21lIGRlYnVnZ2VyIHN1
cHBvcnQNCj4gd2UncmUgd29ya2luZyBvbiBidXQgaGF2ZW4ndCBzZXR0bGVkIG9uIHRoZSBmaW5h
bCBBQkkgeWV0Lg0KPg0KPiBGZWxpeCBLdWVobGluZyAoMSk6DQo+ICAgIGRybS9hbWRrZmQ6IFNp
bXBsaWZ5IGV2aWN0aW9uIHN0YXRlIGxvZ2ljDQo+DQo+IEpheSBDb3Jud2FsbCAoMSk6DQo+ICAg
IGRybS9hbWRrZmQ6IEltcGxlbWVudCBxdWV1ZSBwcmlvcml0eSBjb250cm9scyBmb3IgZ2Z4OQ0K
Pg0KPiBvemVuZyAoMSk6DQo+ICAgIGRybS9hbWRrZmQ6IENQIHF1ZXVlIHByaW9yaXR5IGNvbnRy
b2xzDQo+DQo+ICAgLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
IHwgODQgKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9tcWRfbWFuYWdlci5jICB8IDIwICsrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX21xZF9tYW5hZ2VyLmggIHwgIDIgKy0NCj4gICAuLi4vZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9tcWRfbWFuYWdlcl9jaWsuYyAgfCAyNyArKystLS0NCj4gICAuLi4vZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92OS5jICAgfCAyMCArKy0tLQ0KPiAgIC4uLi9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3ZpLmMgICB8IDIyICsrLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgIHwgMTYgKysrKw0KPiAg
IDcgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQ0KPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
