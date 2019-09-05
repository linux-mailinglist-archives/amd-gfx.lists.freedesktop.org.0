Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02719AA6AF
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 17:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6674D89DFC;
	Thu,  5 Sep 2019 15:03:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180389DC5
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 15:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xvt/g2P0RafUn8mBYBlX14m6sjaCAfb6q9r1bWeVkx/q8DfnGbfb693a9ioyJ09vZ56NX0BFlHbkRjDSw2faVHV00loF/FI5q6fQp4vK/pkyhNxp2jhiwcXy+R6oLKSGB8r/gXg6phYGw1EXIHiEcyOWSxsmIeH4gpVQbwHyuuStp4hVKLRRS6PyFSlwAJiQ1IQ3nuFB7h68uFcxIYPA/LWeKjQM3IWQ68BrTpbLBJ8PKOd5jrz0knTdliMvLHEiEiqEznjkttnpm4NvM9pyKCSGzbWJi5SwiefQWjYziAkD7es/G1vSjY7eIb5dTBBegqYrj2RofEyNBmZHKbmTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF2MXxkEWJswpzjh6PMUbHXOYK7djcnl+knodLeSZOQ=;
 b=EGY6BPFlj4j4xSoITMT0IXdc9/+WM1AC2ZgCw668fuYjzVA5Y+qkRwgt5ku4xVRdfgsvPoO11WIKjkYih/WWHdWL6E+yBVO8h+sOsxWPHr8d7pwbUJHjw0sT66sOqTixzGY8dhxAxFmCrtpINQe2qtSiWmZCs0SCHbucSYB+4w+IXhOclwSAj3JTE7OAszPndZEMKj30rjlxUQVNh+14vnZnm4IgwGyjiWdAhNbE0R1CzxK+QQwqKiy/xGPJ2kKvVvvbyM/xnnIU6F6vFQiHyfNG5P0G5jochIOaWi/nvgU0UVM9iIoGPqfA9OPlLQSbp4yMaBCWNpIKNAFaosXNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3820.namprd12.prod.outlook.com (10.255.173.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 15:03:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 15:03:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fix a building error when
 KFD_SUPPORT_IOMMU_V2 is turned off
Thread-Topic: [PATCH] drm/amdkfd: Fix a building error when
 KFD_SUPPORT_IOMMU_V2 is turned off
Thread-Index: AQHVY/q/UqDhTpoHg0CPjQ9UdOIUgqcdLjsA
Date: Thu, 5 Sep 2019 15:03:46 +0000
Message-ID: <06c86060-870e-468a-f29c-22632238f2dd@amd.com>
References: <20190905150056.10329-1-Yong.Zhao@amd.com>
In-Reply-To: <20190905150056.10329-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [142.116.67.22]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 557727ef-3879-406f-9f7f-08d73212401b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3820; 
x-ms-traffictypediagnostic: DM6PR12MB3820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3820B54F50823E814741BA5A92BB0@DM6PR12MB3820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(305945005)(76176011)(26005)(2501003)(25786009)(81156014)(446003)(5660300002)(6116002)(3846002)(53936002)(8936002)(81166006)(256004)(53546011)(2616005)(31696002)(31686004)(14454004)(476003)(486006)(6246003)(229853002)(7736002)(11346002)(8676002)(386003)(6506007)(99286004)(110136005)(102836004)(6486002)(186003)(6436002)(58126008)(71190400001)(71200400001)(2906002)(478600001)(52116002)(316002)(65956001)(66066001)(66446008)(64756008)(66556008)(86362001)(66476007)(6512007)(66946007)(65806001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3820;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uYDBn89/gknpdZc8K9AwpnD2280z9PqVZrGQLrgslGrhIBl//axp/r/L4axxwJQHl3ns5TvSZ/vV1bkGWVw4FgkU9fg+xAk1PX5D5vT2+9R2C6S3AmLFJg2AEZm8kWbrP8fk4Mqdglv3gW1MpTAlMiK2H1XQSL9Tb7wblx1YPUkQtdavm1ba2GQ6X5JQTy2W13CGuaVCbUdjl2J9hqUxfRo590hEIGzFS+R73Kulmok1KQRru4H7Mbl/dCzJjjrfE4FBCo11P7sgQaF4sNTimdCOjOWrPtNwakeW4F1VT0e1HQ7H7CNX9OROjqPRfu5W1UzZeaRMv8tZLqOHi7smXKiiCNbkysOXkKx5iYPAIziY07LNArtK0OhTj1xGI7XvRXN9/Vf0Rhh4UA/ApOoskjEY81BcWLYgWrzyhuliM28=
Content-ID: <F26A3407F41D714BABB719BE263E4EBF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557727ef-3879-406f-9f7f-08d73212401b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 15:03:46.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhUNEzWwlCMxazfLEqgNM38tIYWBOgsgGHfMj9ykuP7IIsEgrm0mGYYZDV/QUAXN1gIFa87b0XNf2M1pQPdApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF2MXxkEWJswpzjh6PMUbHXOYK7djcnl+knodLeSZOQ=;
 b=GfRbr8EBPM+YshpoS6clFNX1Wku8jVgOaHpQGPfRnNYIF47D/eZXA99O5dSVXRdCyd+RLB1PImRPkSkKeTLqdcR7dkQhBX4/B1+qMRjMqSf5J82eGBvJhZq8aICPgKzr4opuJaujMYdrwb5FSrJCMzYmY5y0SexEqELKiT84j68=
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

T24gMjAxOS0wOS0wNSAxMTowMSwgWmhhbywgWW9uZyB3cm90ZToNCj4gVGhlIGlzc3VlIHdhcyBh
Y2NpZGVudGFsbHkgaW50cm9kdWNlZCByZWNlbnRseS4NCj4NCj4gQ2hhbmdlLUlkOiBJM2IyMWNh
YTE1OTZkNGY3ZGUxODY2YmVkMWNiNWQ4ZmUxYjUxNTA0Yw0KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
IFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCA2ICsrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMNCj4gaW5kZXggMjY3ZWIyZTAxYmVjLi4yMWY1YzU5N2U2OTkgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTM3MSwx
MSArMzcxLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9k
ZXZpY2VfaW5mbyA9IHsNCj4gICANCj4gICAvKiBGb3IgZWFjaCBlbnRyeSwgWzBdIGlzIHJlZ3Vs
YXIgYW5kIFsxXSBpcyB2aXJ0dWFsaXNhdGlvbiBkZXZpY2UuICovDQo+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0ZWRfZGV2aWNlc1tdWzJdID0gew0K
PiArI2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyDQo+ICAgCVtDSElQX0tBVkVSSV0gPSB7Jmth
dmVyaV9kZXZpY2VfaW5mbywgTlVMTH0sDQo+ICsJW0NISVBfQ0FSUklaT10gPSB7JmNhcnJpem9f
ZGV2aWNlX2luZm8sIE5VTEx9LA0KPiArCVtDSElQX1JBVkVOXSA9IHsmcmF2ZW5fZGV2aWNlX2lu
Zm8sIE5VTEx9LA0KPiArI2VuZGlmDQo+ICAgCVtDSElQX0hBV0FJSV0gPSB7Jmhhd2FpaV9kZXZp
Y2VfaW5mbywgTlVMTH0sDQo+ICAgCVtDSElQX1RPTkdBXSA9IHsmdG9uZ2FfZGV2aWNlX2luZm8s
IE5VTEx9LA0KPiAgIAlbQ0hJUF9GSUpJXSA9IHsmZmlqaV9kZXZpY2VfaW5mbywgJmZpamlfdmZf
ZGV2aWNlX2luZm99LA0KPiAtCVtDSElQX0NBUlJJWk9dID0geyZjYXJyaXpvX2RldmljZV9pbmZv
LCBOVUxMfSwNCj4gICAJW0NISVBfUE9MQVJJUzEwXSA9IHsmcG9sYXJpczEwX2RldmljZV9pbmZv
LCAmcG9sYXJpczEwX3ZmX2RldmljZV9pbmZvfSwNCj4gICAJW0NISVBfUE9MQVJJUzExXSA9IHsm
cG9sYXJpczExX2RldmljZV9pbmZvLCBOVUxMfSwNCj4gICAJW0NISVBfUE9MQVJJUzEyXSA9IHsm
cG9sYXJpczEyX2RldmljZV9pbmZvLCBOVUxMfSwNCj4gQEAgLTM4Myw3ICszODYsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1cHBvcnRlZF9kZXZpY2VzW11b
Ml0gPSB7DQo+ICAgCVtDSElQX1ZFR0ExMF0gPSB7JnZlZ2ExMF9kZXZpY2VfaW5mbywgJnZlZ2Ex
MF92Zl9kZXZpY2VfaW5mb30sDQo+ICAgCVtDSElQX1ZFR0ExMl0gPSB7JnZlZ2ExMl9kZXZpY2Vf
aW5mbywgTlVMTH0sDQo+ICAgCVtDSElQX1ZFR0EyMF0gPSB7JnZlZ2EyMF9kZXZpY2VfaW5mbywg
TlVMTH0sDQo+IC0JW0NISVBfUkFWRU5dID0geyZyYXZlbl9kZXZpY2VfaW5mbywgTlVMTH0sDQo+
ICAgCVtDSElQX0FSQ1RVUlVTXSA9IHsmYXJjdHVydXNfZGV2aWNlX2luZm8sICZhcmN0dXJ1c19k
ZXZpY2VfaW5mb30sDQo+ICAgCVtDSElQX05BVkkxMF0gPSB7Jm5hdmkxMF9kZXZpY2VfaW5mbywg
TlVMTH0sDQo+ICAgfTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
