Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902A879EB
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 14:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1235C6EDFA;
	Fri,  9 Aug 2019 12:28:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790070.outbound.protection.outlook.com [40.107.79.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EDB6EDFA
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 12:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4wfChSy+bPuGZZZ7ZuoSuts5C49tLX0PiiaI51Z+kNVBKAsvUJWoyZY7w+gsXn8bECNVQBh66TGFfuyNrTkF/CvuYurmJlWymJFO4TrIGMB5qkTV4e5jyhKVsDdHG6Lb/R+W/EjGbMcfyrT0ggpXfCXSHNluvh2YW5xqQOKxxeN5/0a4hgGJ1rtuo1Jqgek1llkiR7pgKmgbNF8gvgGEbpj5H3t0Zc7PawvYqPistObaJwS3iMvHDAme00l4PDHVRLqmYs6Omb0NRu7h21Ukt0BjoYKF/qvZP6TvJ8nj/qvpJyhUfr+oPG6cTunF4BCXqL7Lc+u9ZJJ9VSuiAVhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG7h6HgGHPDPTDwC1qAa0oqaOxWSIT1cXTeVASfz+0E=;
 b=R0yijZ+8MurUhF9LkVyS3vT+XYZKVyGYk8KNkGD81Pso0BbdWoGS8pQw4KDOHX8NIom6FhEfmxrvs7soTn9fSNYMpyXb7d4Itzz6ivMA7DzS2QD6BdD9e8/arzeXdK+N/e6ZYcJwTkefKNvQGL8gzJzmGg5FQXxZ+JdMf6pyV21cs0zVK92uRfApEgmDU3xVAUhz0n2yNlM4e5Xy/ssEsxCCYWG1VWybm+feS9W4vb/XnYB+ddtagQKVxU1PB7IUp6WuqU9kYecE+mN3WGHgy1iCfX3W8l1crOWls3ICIS9m704PRSSe1VrnG7IhbVGnWbXwl4UQfaydfOhcd7OZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 12:28:55 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 12:28:55 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTlhUHR9uJdXlpECqARkusLOo4qbyv02A
Date: Fri, 9 Aug 2019 12:28:54 +0000
Message-ID: <801142da-51cb-4efd-2cd6-860c65bfb311@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:101:16::25) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 037821e5-0e68-4653-2128-08d71cc524c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2519; 
x-ms-traffictypediagnostic: DM5PR12MB2519:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2519664055F86935777B5A1483D60@DM5PR12MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(58126008)(54906003)(46003)(8676002)(25786009)(110136005)(186003)(6506007)(6246003)(386003)(102836004)(14454004)(478600001)(71200400001)(71190400001)(256004)(486006)(11346002)(5660300002)(64126003)(31686004)(6486002)(2501003)(6436002)(446003)(65826007)(229853002)(4326008)(86362001)(476003)(66946007)(66556008)(66476007)(2616005)(6512007)(64756008)(66446008)(2906002)(305945005)(7736002)(36756003)(31696002)(53936002)(6116002)(52116002)(76176011)(65956001)(81156014)(65806001)(81166006)(99286004)(316002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2519;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QUpOh2bEG9WjgQbo7XUOZZdoFw5Zu8vR5hgmnqdSxpnxhoGCYznz1gUyFr7zcyj6w7kpgi1XvLMOFhusXMMFH22ESc73AFVeEV04yhlMjEJBZoaOxRjtfMaN5DAUr0ilTrl0DYTk6qYxp11HRNNllirsP7dB7U+DASVvTBOOJKufizgcZf45KRzpJfRaPnQzkB64zgLsu7MBjYPyrzfZ2OC5bKw/klGsxAfXv9AHo4t9+amNSxWuMxAj2pDLEXGEZUaRUVsahuuZc9cUZxW/c/8X16lMMqc3/HL5WRygAjq/9u6aSY+xCpmFdpa6/sOahr1PWqXbwKDzIcTpyX+dwLyeNidTjKuMoZ8vHgHZl0eNH6zygBGTdF3/r25nFX3JIPYBucLQ5xPL0jzLXBxGj4giCmQsk38bXHJZ/xZWGtE=
Content-ID: <5CB3F7255F0E5744843A0202440E61BB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037821e5-0e68-4653-2128-08d71cc524c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 12:28:54.9789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIs/ayxm6qxypA7TIpnsIKaPvBWk7t3++kok8AZJLsNNL/ycdjVHr4Gfamed55BV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG7h6HgGHPDPTDwC1qAa0oqaOxWSIT1cXTeVASfz+0E=;
 b=P8L65Dloz/phrV2tPkr1oiGkAFsf62C4RQNy1V5XUCjS8MW2rQXhlyYcUqvhE2IKYNQDzp6hmoP+bX2alMfJe7S1d6ulnCVRn+ApnuPvK9sb5w250fkyxOlvPCpJ91GYfyBAmQY37wOYLSRoUjXn+WSmzh6khuAC5LU8rcNuklA=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMDQ6MTUgc2NocmllYiBaZW5nLCBPYWs6DQo+IEFkZCBkZWZpbml0aW9u
IG9mIGFsbCBzdXBwb3J0ZWQgbXR5cGVzLiBUaGUgUlcgbXR5cGUNCj4gaXMgcmVjZW50bHkgaW50
cm9kdWNlZCBmb3IgYXJjdHVydXMuIEFsc28gYWRkIGRlZmluaXRpb24NCj4gb2YgYSBmbGFnIHRv
IHByb2JlIGFuZCBwb3NzaWJseSBpbnZhbGlkYXRlIHJlbW90ZSBHUFUNCj4gY2FjaGUsIHdoaWNo
IHdpbGwgYmUgdXNlZCBsYXRlciBpbiB0aGlzIHNlcmllcy4NCj4NCj4gQ2hhbmdlLUlkOiBJOTZm
YzliYjRiNmIxZTYyYmRjMTBiNjAwZDhhYWE2YTgwMjEyOGQ2ZA0KPiBTaWduZWQtb2ZmLWJ5OiBP
YWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCA5ICsrKysrKystLQ0KPiAgIGluY2x1ZGUvdWFwaS9kcm0v
YW1kZ3B1X2RybS5oICAgICAgICAgIHwgNCArKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uaA0KPiBpbmRleCAyZWRhM2E4Li43YTc3NDc3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiBAQCAtODAsOCArODAsMTMgQEAgc3RydWN0
IGFtZGdwdV9ib19saXN0X2VudHJ5Ow0KPiAgICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQRV9WRzEw
KGEpCSgodWludDY0X3QpKGEpIDw8IDU3KQ0KPiAgICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQRV9W
RzEwX01BU0sJQU1ER1BVX1BURV9NVFlQRV9WRzEwKDNVTEwpDQo+ICAgDQo+IC0jZGVmaW5lIEFN
REdQVV9NVFlQRV9OQyAwDQo+IC0jZGVmaW5lIEFNREdQVV9NVFlQRV9DQyAyDQo+ICtlbnVtIGFt
ZGdwdV9tdHlwZSB7DQo+ICsJQU1ER1BVX01UWVBFX05DID0gMCwNCj4gKwlBTURHUFVfTVRZUEVf
V0MgPSAxLA0KPiArCUFNREdQVV9NVFlQRV9DQyA9IDIsDQo+ICsJQU1ER1BVX01UWVBFX1VDID0g
MywNCj4gKwlBTURHUFVfTVRZUEVfUlcgPSA0LA0KPiArfTsNCg0KTWhtLCB3aHkgYW4gZW51bT8N
Cg0KQ2hyaXN0aWFuLg0KDQo+ICAgDQo+ICAgI2RlZmluZSBBTURHUFVfUFRFX0RFRkFVTFRfQVRD
ICAoQU1ER1BVX1BURV9TWVNURU0gICAgICBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IEFNREdQVV9QVEVfU05PT1BFRCAgICBcDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+
IGluZGV4IGNhOTdiNjguLjk3ZThlNTEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
YW1kZ3B1X2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+IEBA
IC01MDMsNiArNTAzLDEwIEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV9vcCB7DQo+ICAgI2RlZmlu
ZSBBTURHUFVfVk1fTVRZUEVfQ0MJCSgzIDw8IDUpDQo+ICAgLyogVXNlIFVDIE1UWVBFIGluc3Rl
YWQgb2YgZGVmYXVsdCBNVFlQRSAqLw0KPiAgICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX1VDCQko
NCA8PCA1KQ0KPiArLyogVXNlIFJXIE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLw0K
PiArI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfUlcJCSg1IDw8IDUpDQo+ICsvKiBDYWNoZWFibGUv
c25vb3BhYmxlICovDQo+ICsjZGVmaW5lIEFNREdQVV9WTV9QQUdFX0lOVkFMSURBVEVfUFJPQkUJ
KDEgPDwgOSkNCj4gICANCj4gICBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdmEgew0KPiAgIAkvKiog
R0VNIG9iamVjdCBoYW5kbGUgKi8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
