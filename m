Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F22E784
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 23:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D046E12A;
	Wed, 29 May 2019 21:38:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D206E12A
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 21:38:23 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3562.namprd12.prod.outlook.com (20.178.199.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Wed, 29 May 2019 21:38:21 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 21:38:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Topic: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Index: AQHVFehEmyD2u77WWk61t8+C7m2PoqaCodoA
Date: Wed, 29 May 2019 21:38:21 +0000
Message-ID: <6e34aa0b-f2e7-5137-423b-b8adb3bacc89@amd.com>
References: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
 <1559111516-21940-4-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559111516-21940-4-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 884d97ee-de2a-4e38-ed4f-08d6e47df8c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3562; 
x-ms-traffictypediagnostic: DM6PR12MB3562:
x-microsoft-antispam-prvs: <DM6PR12MB356298599C00D9EDFF30E694921F0@DM6PR12MB3562.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(66946007)(73956011)(2906002)(66446008)(64756008)(66556008)(66476007)(58126008)(64126003)(229853002)(6436002)(53936002)(25786009)(6246003)(65826007)(31686004)(81166006)(6116002)(6636002)(305945005)(81156014)(8676002)(6512007)(3846002)(8936002)(102836004)(7736002)(486006)(6486002)(2616005)(99286004)(52116002)(476003)(6506007)(386003)(2501003)(76176011)(36756003)(110136005)(86362001)(316002)(478600001)(11346002)(26005)(186003)(31696002)(14444005)(71190400001)(71200400001)(256004)(446003)(53546011)(5660300002)(72206003)(66066001)(65956001)(14454004)(65806001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3562;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iJfP25HTUtVF87nPoPJhsMO0WIK6F2tZHufjjWsAcq8PP1NW6MR3ho/CvCVsyxO3E3gTaN98SlpkvwRcJ/4+AVa+OoVvzhp1WEBcGPUe1bn4CPMHFBhmqGZ1Hcw6x4MMQO8cdVBIrb6f6ohFq81Ikx7C25efdJyL6D4JfIpc9iC9Mpx9FC7HYRJGK2+JnIxYe0bJ4lA2UXDfyT/qG+Oh4AXq2rnezcHAc14zVX8JRJtfXjK9jnvywjqVDAA0YIlDhli8tWy3LXbn4bWUZGfe8c/DCsDkx1CCC5+wp9JQNUNsfF1noQ4BA451BSeaAAAiYJjNVqSbR7asCXoGvUT1jfWjgYLTUIO2bQtOnBBYThxxiAnWkYL7yKxsX2+DPBG9+qlH0I3JcG5kLLkx5g1dRRHH6vN/t51IKynS49/E2Ng=
Content-ID: <1D1F328F6D53394893EE97256312FEEC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884d97ee-de2a-4e38-ed4f-08d6e47df8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 21:38:21.7200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3562
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E0Ib2gUlON5DgWnOhQVUjyAqZdAhVX4lNex2MaZkXE=;
 b=xBDCn0q/ZET/FPpJVF3bKajjm9tCd/Pm0TtWmPkC0/SnVTKLL5TlNIU9MtZlMZTqe8KSEgtmmT9w+sx7S1udgQXtB5/mc+oMufM0cMA3saSec0ed3p8/XUZNzveFP720h7wsfF+3nay9cMOST4dnkyIc2+ekGZdQGvgPJtUY0xw=
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

T24gMjAxOS0wNS0yOSAyOjMyIGEubS4sIFhpYW8sIEphY2sgd3JvdGU6DQo+IFNpbmNlIGFtZGdw
dSBoYXMgYWx3YXlzIHJlcXVlc3RlZCBQQ0lFIGF0b21pY3MsIGtmZCBkb24ndA0KPiBuZWVkIGR1
cGxpY2F0ZWQgUENJRSBhdG9taWNzIGVuYWJsZW1lbnQuIFJlZmVycmluZyB0byBhbWRncHUNCj4g
cmVxdWVzdCByZXN1bHQgaXMgZW5vdWdoLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8g
PEphY2suWGlhb0BhbWQuY29tPg0KDQpUaGlzIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8ICA3ICsrKysrKysNCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggfCAgMSArDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KPiBpbmRleCA5ODMy
NmUzYi4uZGRkNmM1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmQuYw0KPiBAQCAtNjIwLDYgKzYyMCwxMyBAQCBib29sIGFtZGdwdV9hbWRrZmRfaXNf
a2ZkX3ZtaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiB2bWlkKQ0KPiAgIAlyZXR1
cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiArYm9vbCBhbWRncHVfYW1ka2ZkX2hhdmVfYXRvbWlj
c19zdXBwb3J0KHN0cnVjdCBrZ2RfZGV2ICprZ2QpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilrZ2Q7DQo+ICsNCj4gKwlyZXR1
cm4gYWRldi0+aGF2ZV9hdG9taWNzX3N1cHBvcnQ7DQo+ICt9DQo+ICsNCj4gICAjaWZuZGVmIENP
TkZJR19IU0FfQU1EDQo+ICAgYm9vbCBhbWRrZmRfZmVuY2VfY2hlY2tfbW0oc3RydWN0IGRtYV9m
ZW5jZSAqZiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+ICAgew0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+IGluZGV4IGY1N2YyOTcuLjhkMTM1YzgyIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+IEBA
IC0xMzUsNiArMTM1LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfc3VibWl0X2liKHN0cnVjdCBrZ2Rf
ZGV2ICprZ2QsIGVudW0ga2dkX2VuZ2luZV90eXBlIGVuZ2luZSwNCj4gICAJCQkJdWludDMyX3Qg
dm1pZCwgdWludDY0X3QgZ3B1X2FkZHIsDQo+ICAgCQkJCXVpbnQzMl90ICppYl9jbWQsIHVpbnQz
Ml90IGliX2xlbik7DQo+ICAgdm9pZCBhbWRncHVfYW1ka2ZkX3NldF9jb21wdXRlX2lkbGUoc3Ry
dWN0IGtnZF9kZXYgKmtnZCwgYm9vbCBpZGxlKTsNCj4gK2Jvb2wgYW1kZ3B1X2FtZGtmZF9oYXZl
X2F0b21pY3Nfc3VwcG9ydChzdHJ1Y3Qga2dkX2RldiAqa2dkKTsNCj4gICANCj4gICBzdHJ1Y3Qg
a2ZkMmtnZF9jYWxscyAqYW1kZ3B1X2FtZGtmZF9nZnhfN19nZXRfZnVuY3Rpb25zKHZvaWQpOw0K
PiAgIHN0cnVjdCBrZmQya2dkX2NhbGxzICphbWRncHVfYW1ka2ZkX2dmeF84XzBfZ2V0X2Z1bmN0
aW9ucyh2b2lkKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiBp
bmRleCA3YjRlYTI0Li43NmExNTk5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZS5jDQo+IEBAIC00ODEsMTcgKzQ4MSwxNSBAQCBzdHJ1Y3Qga2ZkX2RldiAqa2dk
MmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KPiAgIAkgKiAzMiBhbmQgNjQtYml0IHJl
cXVlc3RzIGFyZSBwb3NzaWJsZSBhbmQgbXVzdCBiZQ0KPiAgIAkgKiBzdXBwb3J0ZWQuDQo+ICAg
CSAqLw0KPiAtCXJldCA9IHBjaV9lbmFibGVfYXRvbWljX29wc190b19yb290KHBkZXYsDQo+IC0J
CQlQQ0lfRVhQX0RFVkNBUDJfQVRPTUlDX0NPTVAzMiB8DQo+IC0JCQlQQ0lfRVhQX0RFVkNBUDJf
QVRPTUlDX0NPTVA2NCk7DQo+IC0JaWYgKGRldmljZV9pbmZvLT5uZWVkc19wY2lfYXRvbWljcyAm
JiByZXQgPCAwKSB7DQo+ICsJa2ZkLT5wY2lfYXRvbWljX3JlcXVlc3RlZCA9IGFtZGdwdV9hbWRr
ZmRfaGF2ZV9hdG9taWNzX3N1cHBvcnQoa2dkKTsNCj4gKwlpZiAoZGV2aWNlX2luZm8tPm5lZWRz
X3BjaV9hdG9taWNzICYmDQo+ICsJICAgICFrZmQtPnBjaV9hdG9taWNfcmVxdWVzdGVkKSB7DQo+
ICAgCQlkZXZfaW5mbyhrZmRfZGV2aWNlLA0KPiAgIAkJCSAic2tpcHBlZCBkZXZpY2UgJXg6JXgs
IFBDSSByZWplY3RzIGF0b21pY3NcbiIsDQo+ICAgCQkJIHBkZXYtPnZlbmRvciwgcGRldi0+ZGV2
aWNlKTsNCj4gICAJCWtmcmVlKGtmZCk7DQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4gLQl9IGVsc2Ug
aWYgKCFyZXQpDQo+IC0JCWtmZC0+cGNpX2F0b21pY19yZXF1ZXN0ZWQgPSB0cnVlOw0KPiArCX0N
Cj4gICANCj4gICAJa2ZkLT5rZ2QgPSBrZ2Q7DQo+ICAgCWtmZC0+ZGV2aWNlX2luZm8gPSBkZXZp
Y2VfaW5mbzsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
