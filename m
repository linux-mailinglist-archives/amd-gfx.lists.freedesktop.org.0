Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00EDCF33
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 21:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E5E6EBCB;
	Fri, 18 Oct 2019 19:18:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64206EBCB
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 19:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXKfSFvT8Tgip8+AVtbcRYxBxYSm0OohXv2PBAbgEmUQQnGrpFQeLVaY2Jpjw52XqjJLaFaHrpNrsaPPU8XGnj6xtjJEkV5eVwEJu/qbeBARIPL2+61tnISKA4E0Jlrc/IKSKernLCf1jxgZXqP3Olv4okIn8CMfuWc9pquJi3hbebkdD0jf+MdNUFV1kuxR1RSa6Uznwc0eN2su8Yi2R2dIkn7dhiUiuBPxhPnRXVmhfP7YsX4BTBDIfsYCZV8QxLvso9QvZfBaw8rBQLYz4zA/qf0F9oLx0eUd/naLFVcTQzHNjHMsFmTCDnJPxnTAQmwejA571Kic9enDoTbonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITUjsBjdayeJdK16XcB98iEzofrbO8ZJMEzF3iMsSUM=;
 b=H942Lj+vyveSw9ulz71AKMoJ0vb3BjdzrviS0VTlH47nrOzMu3+9zo83MXXPhIb2lqwzvdriXBsAP7XiSMAEDaeAThr4SSlWnz0SzjWHr6xggJ/Pce6LXeirCnUr6LOvQQN/1ov+fqXuNMtu4mdGdYHrFFGnPAohHs9GgYMAEHDsPc0NLykBWDrmjf/uBRK06mkRgHYaqLAFToHgXVmmbIdZBSnudpDRByIZuaqAVFqudvkEwNboZoIOzCOykAwgpjb3+TEYgRTQ/c6Mmln1GdjiXH5E42XCHDNvzYp+0WYwJzNO6l7aUsHLmBAP1qG7L13o9zp8p6lcTU1h4pmRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2745.namprd12.prod.outlook.com (20.176.117.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 19:18:18 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 19:18:18 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi perfmons"
Thread-Topic: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi
 perfmons"
Thread-Index: AQHVhd3SKovg9Uhs9UGEHs/vc6B8u6dgxduA
Date: Fri, 18 Oct 2019 19:18:18 +0000
Message-ID: <c6454a71-4795-a77e-2334-2faad72f61b7@amd.com>
References: <20191018175928.25307-1-jonathan.kim@amd.com>
 <20191018175928.25307-2-jonathan.kim@amd.com>
In-Reply-To: <20191018175928.25307-2-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531d3e1d-46b4-4763-1132-08d753ffeed3
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2745:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2745D06F72E6ADC7CBB35500926C0@DM6PR12MB2745.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(189003)(199004)(99286004)(486006)(4001150100001)(2906002)(14444005)(14454004)(81166006)(6246003)(186003)(2501003)(81156014)(6506007)(316002)(26005)(102836004)(76176011)(52116002)(8936002)(386003)(5660300002)(3846002)(71190400001)(6116002)(31686004)(25786009)(71200400001)(4326008)(8676002)(256004)(53546011)(66946007)(65806001)(66476007)(66066001)(65956001)(6512007)(6436002)(66556008)(86362001)(31696002)(2616005)(478600001)(110136005)(229853002)(7736002)(11346002)(446003)(476003)(305945005)(64756008)(58126008)(66446008)(36756003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2745;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8EIGspE5pWxgkStnoeol69L+rkv8pt0E/iN5sGeP7tfmtEIDs4gJaRaWD2E/UUA2eDazbMdDp/ICm72fT48+SNIW7AkctFflB3qI/Qg4cwuXFnGP/RCP6BXqBGMzCtP+huY6G1NekzZ1rE3oGpkrmX3Xm2vmCYeW/y7wbIa4GWYZCwLq4gjQGU/2H//ZGIXxbJ7E0LvyDkUpuAK/XHK/6V+EYXeTQGQUxxiDITvumWbzaWHZPYalvrkNlWgBE0VKpWdOyyvbZTAvL+bHocba6VLRd0f5LlPZWddqk6kd/ZCQ7WUNOEuOavwXnccm6SgbgpxOc8+HFyHcPX38LyaRNmOZuSqTKqIkru2wtT+cY+HlYsZl5AHBvVcWkeQVEohcyMGXYfD1tIDnT93CybSVFNZTsqUW7Rk6I3TX7M7Zbec=
Content-ID: <223CE80455C3FF449622E5D4027EF413@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d3e1d-46b4-4763-1132-08d753ffeed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 19:18:18.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWU19enPyKaN4JA3EeoJ9Rwf6ZkCwOeVbfgqUMchxIzHI8b2oq5QVMwc45/6s0YPKhO4AJN7Jss0MtkmXXhDoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITUjsBjdayeJdK16XcB98iEzofrbO8ZJMEzF3iMsSUM=;
 b=bvwY/eYxTQsGiU78MVJdCJ8KvM2/QgXAlHz9MCr9wM8G98dP66oedkg5opuMs0VjvQt0FoDQHzYTZsYGYOnmplqodqa8WhuGMA3QI0qG6BJOk+oW6gRlcgiha4HhzUzbCD0UJL6O+m6l3phPkxBJFWTdbK3zzCM/Rqh3HBIaWJI=
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

WW91IGNhbiBzcXVhc2ggdGhlIHR3byByZXZlcnRzIGludG8gYSBzaW5nbGUgY29tbWl0IHNvIHlv
dSBhdm9pZCANCnJlaW50cm9kdWNpbmcgYSBicm9rZW4gaW50ZXJtZWRpYXRlIHN0YXRlLiBNZW50
aW9uIGJvdGggcmV2ZXJ0ZWQgY29tbWl0cyANCmluIHRoZSBzcXVhc2hlZCBjb21taXQgZGVzY3Jp
cHRpb24uIENoZWNrcGF0Y2gucGwgcHJlZmVycyBhIGRpZmZlcmVudCANCmZvcm1hdCBmb3IgcXVv
dGluZyByZXZlcnRlZCBjb21taXRzLiBSdW4gY2hlY2twYXRjaC5wbCBvbiB5b3VyIGNvbW1pdCB0
byANCnNlZSBhIHByb3BlciBleGFtcGxlLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KT24g
MjAxOS0xMC0xOCAxOjU5IHAubS4sIEtpbSwgSm9uYXRoYW4gd3JvdGU6DQo+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgNTQyNzVjZDE2NDlmNDAzNGM2NDUwYjZjNWE4MzU4ZmNkNGY3ZGRhNi4NCj4NCj4g
aW5jb21wbGV0ZSBzb2x1dGlvbiB0byBkZiBjLXN0YXRlIHJhY2UgY29uZGl0aW9uLiAgc211IG1z
ZyBpbiBwZXJmIGV2ZW50cw0KPiBjYXVzZXMgZGVhZGxvY2suDQo+DQo+IENoYW5nZS1JZDogSWE4
NTE3OWRmMmJkMTY3NjU3ZTQyYTJkODI4YzRhN2M0NzVjMzkyZmYNCj4gU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgMzYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzUgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gaW5kZXggZjQwM2M2MmM5
NDRlLi4xNmZiZDJiYzhhZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RmX3YzXzYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182
LmMNCj4gQEAgLTkzLDIxICs5Myw2IEBAIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmRm
X3YzXzZfYXR0cl9ncm91cHNbXSA9IHsNCj4gICAJCU5VTEwNCj4gICB9Ow0KPiAgIA0KPiAtc3Rh
dGljIGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IGFsbG93KQ0KPiAtew0KPiAtCWludCByID0gMDsNCj4gLQ0KPiAtCWlmIChpc19zdXBwb3J0X3N3
X3NtdShhZGV2KSkgew0KPiAtCQlyID0gc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgYWxs
b3cpOw0KPiAtCX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzDQo+IC0JCQkmJiBh
ZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF9kZl9jc3RhdGUpIHsNCj4gLQkJciA9IGFkZXYt
PnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2RmX2NzdGF0ZSgNCj4gLQkJCWFkZXYtPnBvd2VycGxh
eS5wcF9oYW5kbGUsIGFsbG93KTsNCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm4gcjsNCj4gLX0NCj4g
LQ0KPiAgIHN0YXRpYyB1aW50NjRfdCBkZl92M182X2dldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiAgIAkJCQkgdWludDMyX3QgZmljYWFfdmFsKQ0KPiAgIHsNCj4gQEAgLTEx
Nyw5ICsxMDIsNiBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gICAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9w
Y2llX2luZGV4X29mZnNldChhZGV2KTsNCj4gICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdl
dF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOw0KPiAgIA0KPiAtCWlmIChkZl92M182X3NldF9kZl9j
c3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkNCj4gLQkJcmV0dXJuIDB4RkZGRkZGRkZG
RkZGRkZGRjsNCj4gLQ0KPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9j
aywgZmxhZ3MpOw0KPiAgIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJyaWNJbmRp
cmVjdENvbmZpZ0FjY2Vzc0FkZHJlc3MzKTsNCj4gICAJV1JFRzMyKGRhdGEsIGZpY2FhX3ZhbCk7
DQo+IEBAIC0xMzIsOCArMTE0LDYgQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgDQo+ICAgCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gICANCj4gLQlkZl92M182X3Nl
dF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsNCj4gLQ0KPiAgIAlyZXR1cm4gKCgo
ZmljYWRoX3ZhbCAmIDB4RkZGRkZGRkZGRkZGRkZGRikgPDwgMzIpIHwgZmljYWRsX3ZhbCk7DQo+
ICAgfQ0KPiAgIA0KPiBAQCAtMTQ1LDkgKzEyNSw2IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0
X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwNCj4g
ICAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2
KTsNCj4gICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFk
ZXYpOw0KPiAgIA0KPiAtCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRF
X0RJU0FMTE9XKSkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZh
ZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICAgCVdSRUczMihhZGRyZXNzLCBzbW5ERl9Q
SUVfQU9OX0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzQWRkcmVzczMpOw0KPiAgIAlXUkVHMzIo
ZGF0YSwgZmljYWFfdmFsKTsNCj4gQEAgLTE1Nyw5ICsxMzQsOCBAQCBzdGF0aWMgdm9pZCBkZl92
M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBmaWNhYV92
YWwsDQo+ICAgDQo+ICAgCVdSRUczMihhZGRyZXNzLCBzbW5ERl9QSUVfQU9OX0ZhYnJpY0luZGly
ZWN0Q29uZmlnQWNjZXNzRGF0YUhpMyk7DQo+ICAgCVdSRUczMihkYXRhLCBmaWNhZGhfdmFsKTsN
Cj4gLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7
DQo+ICAgDQo+IC0JZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9BTExPVyk7
DQo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3Mp
Ow0KPiAgIH0NCj4gICANCj4gICAvKg0KPiBAQCAtMTc3LDE3ICsxNTMsMTIgQEAgc3RhdGljIHZv
aWQgZGZfdjNfNl9wZXJmbW9uX3JyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAg
CWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7
DQo+ICAgCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2
KTsNCj4gICANCj4gLQlpZiAoZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9E
SVNBTExPVykpDQo+IC0JCXJldHVybjsNCj4gLQ0KPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRl
di0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOw0KPiAgIAlXUkVHMzIoYWRkcmVzcywgbG9fYWRkcik7
DQo+ICAgCSpsb192YWwgPSBSUkVHMzIoZGF0YSk7DQo+ICAgCVdSRUczMihhZGRyZXNzLCBoaV9h
ZGRyKTsNCj4gICAJKmhpX3ZhbCA9IFJSRUczMihkYXRhKTsNCj4gICAJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOw0KPiAtDQo+IC0JZGZfdjNfNl9z
ZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9BTExPVyk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8q
DQo+IEBAIC0yMDQsMTcgKzE3NSwxMiBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BlcmZtb25fd3Jl
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgbG9fYWRkciwNCj4gICAJYWRk
cmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsNCj4g
ICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOw0K
PiAgIA0KPiAtCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FM
TE9XKSkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5w
Y2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICAgCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsNCj4g
ICAJV1JFRzMyKGRhdGEsIGxvX3ZhbCk7DQo+ICAgCVdSRUczMihhZGRyZXNzLCBoaV9hZGRyKTsN
Cj4gICAJV1JFRzMyKGRhdGEsIGhpX3ZhbCk7DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gLQ0KPiAtCWRmX3YzXzZfc2V0X2RmX2Nz
dGF0ZShhZGV2LCBERl9DU1RBVEVfQUxMT1cpOw0KPiAgIH0NCj4gICANCj4gICAvKiBnZXQgdGhl
IG51bWJlciBvZiBkZiBjb3VudGVycyBhdmFpbGFibGUgKi8NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
