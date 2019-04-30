Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E69F394
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 11:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63DF89012;
	Tue, 30 Apr 2019 09:58:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36A989012
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 09:58:50 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 09:58:49 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.010; Tue, 30 Apr
 2019 09:58:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Topic: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Index: AQHU/uQe3a9JFuTW4Ei0FX7BBwKNtqZUbsaAgAAGylCAAAM7gA==
Date: Tue, 30 Apr 2019 09:58:49 +0000
Message-ID: <0df2a92e-c021-66f7-f6ba-4984e24d5d6c@amd.com>
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
 <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
 <749d808b-5afc-488e-6d31-fae5e8dac208@gmail.com>
 <MN2PR12MB3408BADD8375F5B6D6090244FE3A0@MN2PR12MB3408.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3408BADD8375F5B6D6090244FE3A0@MN2PR12MB3408.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02dbc54f-8e5e-4c2f-3bb6-08d6cd527106
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1628; 
x-ms-traffictypediagnostic: DM5PR12MB1628:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB16289EA5B42890C85841587C833A0@DM5PR12MB1628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(376002)(366004)(51914003)(199004)(189003)(13464003)(93886005)(71200400001)(5660300002)(478600001)(8676002)(2501003)(64756008)(71190400001)(66946007)(66476007)(7736002)(66556008)(256004)(229853002)(72206003)(305945005)(73956011)(25786009)(36756003)(64126003)(6436002)(14444005)(14454004)(66574012)(966005)(66446008)(6486002)(8936002)(65956001)(65806001)(68736007)(186003)(6116002)(52116002)(486006)(316002)(65826007)(99286004)(81156014)(6506007)(53936002)(6306002)(53546011)(76176011)(97736004)(446003)(11346002)(386003)(46003)(110136005)(86362001)(31686004)(31696002)(58126008)(6246003)(476003)(81166006)(6512007)(2616005)(102836004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1628;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ens3y2XmIwjGY9WS1xF/2SqTZJU2/q1csTsBM3Ix4qzAFgbnenord5HUWwhXaX0C/OYBctGMtuvanc50kX9icm4ZjLAlM+6vOPAABE+jk4Xw/mASPUa9xyg6FOnFn3J2zA9DLiU3gEcfPitdzsBvdVG6iAnhMO0ulykLMNmFC7A5cDYj2ujDzSaMTrnp2rcP6fNccpVGlEx244Mm2WNWbiIwRajR9ohFRhrBpmzYYdHB3RL/t/d4JX3+Ev2lNGDiYuC08Sb/YmTaiXlCNWmsEt+8MqLkzDj3I25e5wINydr07FzidRFbV/MRTJOKME3e2MSMYi+Ea5Mi5zBUuXG/sWdu/oarm5/omSiWCX6l8MyR0J1Z8zv9h6Cl/trmZAhxW8NcFe7vCGvX2OPy5rDGiU7MCKUPUsBcac1BEe/PrpE=
Content-ID: <2F0E91896303BA49B4DB46D610618FAF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dbc54f-8e5e-4c2f-3bb6-08d6cd527106
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 09:58:49.0263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY7oe4ASyyPbFKItt1Ii2pCl3oyIYd1L1KBIb/q40jw=;
 b=o3l5O0+7Q/a6sCIzAKzfNzDpQrV5l07j8XP91Wyir2/L3e+lZKwo92I29oHclFz1/kP0HmszNXjchsx0hQP+l55ELhgeEQY/iTm3By7lYU0Ou8YcaOqx3FtvIF8GFyMPPPbQwOiWAqNTAppShtMyN/+/N1iXCULDU1o+Zp0njZI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTE6NTMgc2NocmllYiBIdWFuZywgVHJpZ2dlcjoNCj4gSGkgQ2hyaXN0
aWFuICYgRmVsaXgsDQo+DQo+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLg0KPg0KPiBCdXQg
YWN0dWFsbHkgY3VycmVudGx5IENTQSBpcyBtYXBwZWQgb25seSBpbiBhbWRncHVfZHJpdmVyX29w
ZW5fa21zIHVuZGVyIFNSLUlPVi4NCj4gU28gd291bGQgeW91IGdpdmUgbW9yZSBpbmZvcm1hdGlv
biBhYm91dCAnIFdlbGwgdGhhdCBpcyBleGFjdGx5IHdoYXQgd2UgYWxyZWFkeSBkbyBoZXJlJz8g
V2hlcmUgSSBjYW4gZmluZCBpdHMgaW1wbGVtZW50YXRpb24/DQoNCldlbGwgdGhlIHBsYW4gd2Fz
IHRvIG1vdmUgdGhpcyB0byB3aGVuIHRoZSBhY3R1YWxseSBleGVjdXRpb24gY29udGV4dCBpcyAN
CmNyZWF0ZWQuIEJ1dCBSZXggbGVmdCB0aGUgY29tcGFueSwgY291bGQgYmUgdGhhdCB0aGUgcGF0
Y2hlcyBmb3IgdGhpcyANCndoZXJlIG5ldmVyIGNvbW1pdHRlZC4NCg0KPg0KPiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgSSB3aWxsICB0cnkgdGhlIG1ldGhvZCAnSW5zdGVhZCBvZiBjaGVja2luZyBpZiBz
b21lIHBhZ2UgdGFibGVzIGFyZSBhbHJlYWR5IGZpbGxlZCB3ZSBjaGVjayBpZiBzb21lIG1hcHBp
bmcgaXMgYWxyZWFkeSBtYWRlJw0KDQpZZWFoLCB0aGF0IHNob3VsZCBjZXJ0YWlubHkgd29yayBh
cyB3ZWxsLiBKdXN0IGNoZWNrIGFsbCBlbnRyaWVzIG9mIHRoZSANCnJvb3QgUEQgaW4gYSBmb3Ig
bG9vcCBpZiBhbnkgc3Vic2VxdWVudCBQRHMgYXJlIGFsbG9jYXRlZCBhbmQgYWJvcnQgaWYgDQp5
b3UgZmluZCBvbmUuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiBUaGFua3MgJiBCZXN0IFdpc2hlcywN
Cj4gVHJpZ2dlciBIdWFuZw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4g
U2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMTkgNToyMyBQTQ0KPiBUbzogS3VlaGxpbmcsIEZl
bGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgSHVhbmcsIFRyaWdnZXIgPFRyaWdnZXIuSHVh
bmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWRncHU6IFVubWFwIENTQSB1bmRlciBTUi1JT1YgaW4gS0ZEIHBhdGgN
Cj4NCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBXZWxsIHRoYXQgaXMgZXhhY3Rs
eSB3aGF0IHdlIGFscmVhZHkgZG8gaGVyZS4gVGhlIG9ubHkgcHJvYmxlbSBpcyB3ZSBkbyB0aGUg
d3JvbmcgY2hlY2sgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZSgpLg0KPg0KPiBJbnN0ZWFkIG9mIGNo
ZWNraW5nIGlmIHNvbWUgcGFnZSB0YWJsZXMgYXJlIGFscmVhZHkgZmlsbGVkIHdlIGNoZWNrIGlm
IHNvbWUgbWFwcGluZyBpcyBhbHJlYWR5IG1hZGUuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzdGlh
bi4NCj4NCj4gQW0gMzAuMDQuMTkgdW0gMDE6MzQgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+
PiBJIHJlbWVtYmVyIGEgcGFzdCBkaXNjdXNzaW9uIHRvIGNoYW5nZSB0aGUgQ1NBIGFsbG9jYXRp
b24vbWFwcGluZw0KPj4gc2NoZW1lIHRvIGF2b2lkIHRoaXMgaXNzdWUgaW4gdGhlIGZpcnN0IHBs
YWNlLiBDYW4gYWRkaW5nIHRoZSBDU0EgdG8NCj4+IHRoZSBWTSBiZSBkZWxheWVkIGEgbGl0dGxl
IHRvIGEgcG9pbnQgYWZ0ZXIgdGhlIFZNIGdldHMgY29udmVydGVkIHRvIGEgY29tcHV0ZSBWTT8N
Cj4+IE1heWJlIHRoZSBmaXJzdCBjb21tYW5kIHN1Ym1pc3Npb24/DQo+Pg0KPj4gUmVnYXJkcywN
Cj4+ICAgICAgRmVsaXgNCj4+DQo+PiBPbiAyMDE5LTA0LTI4IDY6MjUgYS5tLiwgVHJpZ2dlciBI
dWFuZyB3cm90ZToNCj4+PiBJbiBhbWRncHUgb3BlbiBwYXRoLCBDU0Egd2lsbCBiZSBtYXBwZW5l
ZCBpbiBWTSwgc28gd2hlbiBvcGVuaW5nIEtGRCwNCj4+PiBjYWxsaW5nIG1kZ3B1X3ZtX21ha2Vf
Y29tcHV0ZSAgd2lsbCBmYWlsIGJlY2F1c2UgaXQgZm91bmQgdGhpcyBWTSBpcw0KPj4+IG5vdCBh
IGNsZWFuIFZNIHdpdGggc29tZSBtYXBwaW5ncywgYXMgYSByZXN1bHQsIGl0IHdpbGwgbGVhZCB0
bw0KPj4+IGZhaWxlZCB0byBjcmVhdGUgcHJvY2VzcyBWTSBvYmplY3QNCj4+Pg0KPj4+IFRoZSBm
aXggaXMgdHJ5IHRvIHVubWFwIENTQSwgYW5kIGFjdHVhbGx5IENTQSBpcyBub3QgbmVlZGVkIGlu
DQo+Pj4gY29tcHV0ZSBWRiB3b3JsZCBzd2l0Y2gNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRy
aWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMTAgKysrKysr
KysrKw0KPj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAg
ICAgICAgfCAgMiArLQ0KPj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPj4+IGluZGV4IDY5N2I4ZWYuLmUwYmM0NTcg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9ncHV2bS5jDQo+Pj4gQEAgLTk1Niw2ICs5NTYsMTYgQEAgaW50IGFtZGdwdV9hbWRrZmRf
Z3B1dm1fYWNxdWlyZV9wcm9jZXNzX3ZtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsDQo+Pj4gICAgICAg
aWYgKGF2bS0+cHJvY2Vzc19pbmZvKQ0KPj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+Pj4NCj4+PiArICAgIC8qIERlbGV0ZSBDU0EgbWFwcGluZyB0byBtYWtlIHN1cmUgdGhpcyBW
TSBpcyBhIGNsZWFuIFZNICBiZWZvcmUNCj4+PiArICAgICAqICBjb252ZXJ0aW5nIFZNDQo+Pj4g
KyAgICAgKi8NCj4+PiArICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgJiYgZHJ2X3ByaXYt
PmNzYV92YSkgew0KPj4+ICsgICAgICAgICAgICBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT52aXJ0
LmNzYV9vYmosIHRydWUpOw0KPj4+ICsgICAgICAgICAgICBhbWRncHVfdm1fYm9fcm12KGFkZXYs
IGRydl9wcml2LT5jc2FfdmEpOw0KPj4+ICsgICAgICAgICAgICBkcnZfcHJpdi0+Y3NhX3ZhID0g
TlVMTDsNCj4+PiArICAgICAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT52aXJ0LmNz
YV9vYmopOw0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiAgICAgICAvKiBDb252ZXJ0IFZNIGludG8g
YSBjb21wdXRlIFZNICovDQo+Pj4gICAgICAgcmV0ID0gYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShh
ZGV2LCBhdm0sIHBhc2lkKTsNCj4+PiAgICAgICBpZiAocmV0KQ0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYw0KPj4+IGluZGV4IGRhN2I0ZmUuLjM2MWMyZTUg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
DQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+Pj4g
QEAgLTEwNjksNyArMTA2OSw3IEBAIHZvaWQgYW1kZ3B1X2RyaXZlcl9wb3N0Y2xvc2Vfa21zKHN0
cnVjdA0KPj4+IGRybV9kZXZpY2UgKmRldiwNCj4+Pg0KPj4+ICAgICAgIGFtZGdwdV92bV9ib19y
bXYoYWRldiwgZnByaXYtPnBydF92YSk7DQo+Pj4NCj4+PiAtICAgIGlmIChhbWRncHVfc3Jpb3Zf
dmYoYWRldikpIHsNCj4+PiArICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgJiYgZnByaXYt
PmNzYV92YSkgew0KPj4+ICAgICAgICAgICAgICAgLyogVE9ETzogaG93IHRvIGhhbmRsZSByZXNl
cnZlIGZhaWx1cmUgKi8NCj4+PiAgICAgICAgICAgICAgIEJVR19PTihhbWRncHVfYm9fcmVzZXJ2
ZShhZGV2LT52aXJ0LmNzYV9vYmosIHRydWUpKTsNCj4+PiAgICAgICAgICAgICAgIGFtZGdwdV92
bV9ib19ybXYoYWRldiwgZnByaXYtPmNzYV92YSk7DQo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
