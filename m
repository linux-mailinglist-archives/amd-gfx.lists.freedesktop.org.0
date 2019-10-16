Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE2D91DE
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 15:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1356E974;
	Wed, 16 Oct 2019 13:01:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004106E974
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 13:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcwHwAHDQTFXBYyPv/NeCZJbzJ1cg8SaO++iumpcgHYOQ8aI7b0qda7o/Ws7g+7zLd2EQWpaO0KBQD1ED+KOL9HeYEWsPIUUvqynSuPD/Bj1Q9YbcvElMQWkVcpsgU29rKzuOXzIuouSd/5GSq0jxWW4+GzDGY5jnn6g6k9sdVQnnA05t7URJLsk5Hj1d4LrNliTJxBPIJwNy6QAHL6TqH/Ao2wiJhBZ1ZzdqkzxmLA1zgiIiT/Crz8YUsMHTjmit3kKfzWkDzbE3JtlNQOibwINEQeWDhN5acLbcrm3ETJjjFNPVDYHdGND0XIPceufqEBxvzCFS+feUnwIuk9kIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a8D84LW7Y7cKJkUQEA9uwcKFAhA1g0Dtfis9CbRAZI=;
 b=cf5Wf0Rd/fVpCuzcXdjdRaQ1axoIjx28zI9oQB3D19ccyPEeqhaCmojawk/Qdw+Xsv/ROwF+5nNYrGC6NkTkAPdPaGtH4GnsSprwkEezPiHu7Cy8mmou2Dx/8cGTCXTz5Xk+oHPN3EMkhmUOh4BVRxQc4rncgyQr4cOiJ3aLpxA+ruwn32vlV+Wb9vQdaA38quPetSrGvMhXoHZ2QQZsp3fRMW5MxVYExzmYFoX5BUwRSuIadY0wrqSf3mXI3DOvKx4EqfbU+vGAr8Zp6VDkYEfsJ3GzrFoHJUnpn7rgSngUMQJnkBQEw3N7DCfckif/jEoLE53lIx8gR1hzYfF8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1287.namprd12.prod.outlook.com (10.168.168.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 13:01:41 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Wed, 16 Oct
 2019 13:01:41 +0000
From: James Zhu <jamesz@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhu, James"
 <James.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu/uvd:Add uvd enc session bo
Thread-Topic: [PATCH 1/3] drm/amdgpu/uvd:Add uvd enc session bo
Thread-Index: AQHVg6UGdSzLp4ZMgEmSSROLX4V/hKdc+MkAgABDn4A=
Date: Wed, 16 Oct 2019 13:01:40 +0000
Message-ID: <700870ad-2a19-3d92-ef42-fe53c9735185@amd.com>
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
 <1571177279-9435-2-git-send-email-James.Zhu@amd.com>
 <3198889b-9df5-dd90-0457-79a1a886ec4d@gmail.com>
In-Reply-To: <3198889b-9df5-dd90-0457-79a1a886ec4d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bcb050c-70b0-4f9b-d2d4-08d75238fc9b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1287:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1287A2FA8A9641909646F364E4920@CY4PR12MB1287.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(4001150100001)(66556008)(476003)(2616005)(2906002)(36756003)(6116002)(256004)(3846002)(31686004)(66946007)(5660300002)(64756008)(66446008)(11346002)(446003)(478600001)(305945005)(66476007)(7736002)(14454004)(486006)(66066001)(25786009)(110136005)(186003)(6512007)(99286004)(316002)(52116002)(26005)(102836004)(76176011)(6436002)(6506007)(71200400001)(81166006)(31696002)(53546011)(8936002)(81156014)(229853002)(6246003)(386003)(71190400001)(2501003)(8676002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1287;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qk2HpQrDJYdg7PvWRgdHcDqluEyRFMOLGm+ky4s3L8Nou/LwOTfWuVOgOUjG9ItNDenh/N2Wel5DuOK00UjIwsT24Q0u5oY0PBGr0UrM8NrY8JR+NzXcqVP/kISsI82mjEmxWqTpFAisMaeGYX7yTKbzLEFlRxq2NfGDassEQ7eJUufscAGBeH65ZiFWvSqkvy7MLTGA0/KYOCHzjbkOC0bv9qkVjtP4rsb/iKo26nwmKtC+II/B0+i980WVDNAeU2VXTyJzb2JJOBamojm7APHptS50drUxXAOKQhOX2PFqRzlBTTsQOGbzKgVB4Ti5pO5VaFps64GfoV8wGoNmA7E+Z4JJfPX8z0o7QTkRqI/z//iNdZYQWyT7Yr79A8dsjx/BusG1l9z8fsbYLdypbvZHA/Xj8lnnwSOcpaqCxi4=
Content-ID: <043FDD7C8307784D9CA6DA041ECCCBDA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcb050c-70b0-4f9b-d2d4-08d75238fc9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 13:01:41.0149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2giH9xEoQRYqV6SEslTkbHEFd8gPSfpjVBweSftG3T98o3EPStjSxk9SOznN2fbh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1287
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a8D84LW7Y7cKJkUQEA9uwcKFAhA1g0Dtfis9CbRAZI=;
 b=qV4dan4n5l3Nzn8z7nYMSmBfqqpv9x07X8qxQOpRIdBpqCcg9lBQChv8ndxnsckcpXXU66N3a7el5g+UB1LQPxLwpKFY0nyl9yoSNrSvcv5QU+r29zQm9jLsOLQAYPM1ThAWnviWkQcjrJp8PaWpFwIsiYNsXsXW9is3LEdoFO8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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

VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQpBbGV4IGhhcyBhIG5ldyBwYXRjaCBzdWJtaXQs
IEkgYW0gdmVyaWZ5aW5nIGl0Lg0KDQpUaGFua3MhDQoNCkphbWVzIFpodQ0KDQpPbiAyMDE5LTEw
LTE2IDQ6NTkgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gQW0gMTYuMTAuMTkgdW0g
MDA6MDggc2NocmllYiBaaHUsIEphbWVzOg0KPj4gQWRkIHV2ZCBlbmMgc2Vzc2lvbiBibyBmb3Ig
dXZkIGVuY29kZSBJQiB0ZXN0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFpodSA8SmFt
ZXMuWmh1QGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91dmQuaCB8IDQgKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdXZkLmggDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuaA0K
Pj4gaW5kZXggNWViNjMyOC4uMWUzOWM4YSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3V2ZC5oDQo+PiBAQCAtNjcsNiArNjcsMTAgQEAgc3RydWN0IGFtZGdwdV91
dmQgew0KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZMKgwqDCoMKgwqDCoMKgIGhhcnZlc3RfY29uZmln
Ow0KPj4gwqDCoMKgwqDCoCAvKiBzdG9yZSBpbWFnZSB3aWR0aCB0byBhZGp1c3QgbmIgbWVtb3J5
IHN0YXRlICovDQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkwqDCoMKgwqDCoMKgwqAgZGVjb2RlX2lt
YWdlX3dpZHRoOw0KPj4gKw0KPj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvICplbmNfc2Vzc2lv
bl9ibzsNCj4+ICvCoMKgwqAgdm9pZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZW5jX3Nlc3Np
b25fY3B1X2FkZHI7DQo+PiArwqDCoMKgIHVpbnQ2NF90wqDCoMKgwqDCoMKgwqDCoMKgIGVuY19z
ZXNzaW9uX2dwdV9hZGRyOw0KPg0KPiBQbGVhc2UgZG9uJ3Qga2VlcCB0aGF0IGFsbG9jYXRlZCBh
bGwgdGhlIHRpbWUsIGJ1dCByYXRoZXIgb25seSANCj4gYWxsb2NhdGUgaXQgb24gZGVtYW5kIGR1
cmluZyB0aGUgSUIgdGVzdC4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4gwqAg
fTsNCj4+IMKgIMKgIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpOw0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
