Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5CBFB4F
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC66EE15;
	Thu, 26 Sep 2019 22:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800089.outbound.protection.outlook.com [40.107.80.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783806EE15
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 22:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwZObjGDnK8+rzBFHyy0vA7nuMl1Y4k4dN/terhDj5cJbyPhYnURM7kRcivd4soOQLleZLIwmlg8ezfPDjPeojlhic/rxO5CEn4O+XxY02CjrCDy7MlC1UHE2fbLcQ19jXPlpRHtsFa3xKofc0rrd/DAN4/gQrZn35Yt0uBVE/VCunXGXDAGDsJMvluUaehOlHhyV0smsR5SFh3G4x8YdVpoksO24wJ6oBrn2I6ZN7zClV3x/74Gjis7tECl1WqbttpDLxIXcfvt9pTNR10T9SK47x/ya9MFFfXm/QBNfsTkHbJWI0bXPlkm80mVxm4Ddq8K2xHC2L8bg6AXqB45+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWNtN4iFeCXml74k4ECzTxmvR27EnLzB81pp/PFo5jc=;
 b=lTV4+Am5v2bTxTpTbSY9L5c1vuTE3q+ifj6MoDyQO9jNTHrph55XqbUfaaa7VE5bh7tN5/DWKYqbt9q8hyNyNE2bqeSEr0K+kvrk58ofxGO1dfb9yRbra8txSqqPBtoqnZziRKA9KognooqNtiDbQ6ZQrQZgMmsoMbzrEvyRBoW/kW+X4xNs3SvUMi6q+aSIuEUGTi9eHTscn1XftO/efN9yPLHTEf6+RQHUGd5wwZ8Mk3/TeKKQshQrnktCW1khztRMIPV/0wZS2uh2wdX566eL97hJLVN4bC/7GdMv85YBLoVxzoSTsceP+R7R3w7p0hRASP8L3YUqLpekBX5uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2697.namprd12.prod.outlook.com (20.176.116.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 26 Sep 2019 22:27:43 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 22:27:43 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/amdkfd: Use setup_vm_pt_regs function from base
 driver in KFD
Thread-Topic: [PATCH 2/3] drm/amdkfd: Use setup_vm_pt_regs function from base
 driver in KFD
Thread-Index: AQHVc81CLO+qT9lg90KvUzh4Qs8t7Kc+i54A
Date: Thu, 26 Sep 2019 22:27:43 +0000
Message-ID: <49f5025e-6388-1536-727e-55f266263d28@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
 <20190925181527.17091-2-Yong.Zhao@amd.com>
In-Reply-To: <20190925181527.17091-2-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::15) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0201ad35-a209-454f-af6d-08d742d0bf76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2697; 
x-ms-traffictypediagnostic: DM6PR12MB2697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB26972F3D5E9A32F9E0A9AF5492860@DM6PR12MB2697.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(66476007)(81166006)(76176011)(26005)(6506007)(386003)(99286004)(53546011)(7736002)(305945005)(5660300002)(102836004)(65956001)(66066001)(6512007)(14454004)(36756003)(478600001)(65806001)(3846002)(2501003)(2906002)(6436002)(64756008)(66446008)(66556008)(6116002)(186003)(6486002)(66946007)(71200400001)(71190400001)(25786009)(110136005)(58126008)(229853002)(14444005)(256004)(11346002)(446003)(6246003)(8936002)(86362001)(31696002)(81156014)(8676002)(31686004)(316002)(2616005)(476003)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2697;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RRI5jjc+IG4eNvkVuBGy+9Q+dR6SjB0M5Pmgls5ekZuK9APEa3y3PtPQZrupW7/K/L6RijP8XcZyfMUr1lGjAVWB539b/ba4FmkpDXWUeS7Y81XcCsIEKJARBlmZ1T6ayQag+BC1jTHqLKSfk02EDz+GTyTXTQ0DQH9a9SRQ/poOxxHr/h6Kv7zP79JtqJcbAl2oi3fBlRvI9zOQPen5aJaYr9LAOxcKO4Q6bQocOZ+D/Dbz3LIRpjB6Wzu6p12ukKSWxkXolmwMqL4DiDhFaWONLAs4HuFnzIfvr8kLid5e6gGTyxZ54KqV8sUXwBCCQJMJ+lntCxEb5BMZAJvoxSabv3E0LfmwfBFPjpXb2zcBHVZWxo1PX+1baRARK7xefts+D32pG1TLsLS+Rbd8rnqqPaI3KREhBn3ibW2YwQs=
Content-ID: <064BC69390A4B742BD69998DCD33EFC0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0201ad35-a209-454f-af6d-08d742d0bf76
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 22:27:43.1430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3f6Cyfh3Dm0kwt+1sHsns4mrfIGBzdNgIUae+rHa8UhxxXFipXwcMQBQC6aWiRX6Fu+N+s54ROLkiQmoIldqVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2697
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWNtN4iFeCXml74k4ECzTxmvR27EnLzB81pp/PFo5jc=;
 b=3uviWQpexsMvfYQjcLm0CvOcvYCh84nFYYYrg2vb4fK5cesb091lQmhvUZEmlfCrokrgRd29bUlh9WAbhSxUWONOwFcZyg2pam9cUyso47Wc1z13jXDemjI6RQkE7lhmAaTWi/JXa2a6h3/7gDiEqxKFTJUkqAVmUbWRgOkAnso=
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

T24gMjAxOS0wOS0yNSAyOjE1IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IFRoaXMgd2FzIGRv
bmUgb24gR0ZYOSBwcmV2aW91c2x5LCBub3cgZG8gaXQgZm9yIEdGWDEwLg0KPg0KPiBDaGFuZ2Ut
SWQ6IEk0NDQyZTYwNTM0YzU5YmM5NTI2YTY3MzU1OWYwMThiYTgwNThkZWFjDQo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBGZWxp
eCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIC4uLi9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYyAgICB8IDIzICsrKy0tLS0tLS0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ2Z4X3YxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9nZnhfdjEwLmMNCj4gaW5kZXggZmU1YjcwMmM3NWNlLi42NDU2OGVkMzI3OTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Yx
MC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4
X3YxMC5jDQo+IEBAIC00Miw2ICs0Miw3IEBADQo+ICAgI2luY2x1ZGUgInYxMF9zdHJ1Y3RzLmgi
DQo+ICAgI2luY2x1ZGUgIm52LmgiDQo+ICAgI2luY2x1ZGUgIm52ZC5oIg0KPiArI2luY2x1ZGUg
ImdmeGh1Yl92Ml8wLmgiDQo+ICAgDQo+ICAgZW51bSBocWRfZGVxdWV1ZV9yZXF1ZXN0X3R5cGUg
ew0KPiAgIAlOT19BQ1RJT04gPSAwLA0KPiBAQCAtMjUxLDExICsyNTIsNiBAQCBzdGF0aWMgaW50
IGtnZF9zZXRfcGFzaWRfdm1pZF9tYXBwaW5nKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVuc2lnbmVk
IGludCBwYXNpZCwNCj4gICAJCQlBVENfVk1JRDBfUEFTSURfTUFQUElOR19fVkFMSURfTUFTSzsN
Cj4gICANCj4gICAJcHJfZGVidWcoInBhc2lkIDB4JXggdm1pZCAlZCwgcmVnIHZhbHVlICV4XG4i
LCBwYXNpZCwgdm1pZCwgcGFzaWRfbWFwcGluZyk7DQo+IC0JLyoNCj4gLQkgKiBuZWVkIHRvIGRv
IHRoaXMgdHdpY2UsIG9uY2UgZm9yIGdmeCBhbmQgb25jZSBmb3IgbW1odWINCj4gLQkgKiBmb3Ig
QVRDIGFkZCAxNiB0byBWTUlEIGZvciBtbWh1YiwgZm9yIElIIGRpZmZlcmVudCByZWdpc3RlcnMu
DQo+IC0JICogQVRDX1ZNSUQwLi4xNSByZWdpc3RlcnMgYXJlIHNlcGFyYXRlIGZyb20gQVRDX1ZN
SUQxNi4uMzEuDQo+IC0JICovDQo+ICAgDQo+ICAgCXByX2RlYnVnKCJBVEhVQiwgcmVnICV4XG4i
LCBTT0MxNV9SRUdfT0ZGU0VUKEFUSFVCLCAwLCBtbUFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HKSAr
IHZtaWQpOw0KPiAgIAlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChBVEhVQiwgMCwgbW1BVENfVk1J
RDBfUEFTSURfTUFQUElORykgKyB2bWlkLA0KPiBAQCAtOTEwLDcgKzkwNiw2IEBAIHN0YXRpYyB2
b2lkIHNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVfYmFzZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1
aW50MzJfdCB2bWlkLA0KPiAgIAkJdWludDY0X3QgcGFnZV90YWJsZV9iYXNlKQ0KPiAgIHsNCj4g
ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBnZXRfYW1kZ3B1X2RldmljZShrZ2QpOw0K
PiAtCXVpbnQ2NF90IGJhc2UgPSBwYWdlX3RhYmxlX2Jhc2UgfCBBTURHUFVfUFRFX1ZBTElEOw0K
PiAgIA0KPiAgIAlpZiAoIWFtZGdwdV9hbWRrZmRfaXNfa2ZkX3ZtaWQoYWRldiwgdm1pZCkpIHsN
Cj4gICAJCXByX2VycigidHJ5aW5nIHRvIHNldCBwYWdlIHRhYmxlIGJhc2UgZm9yIHdyb25nIFZN
SUQgJXVcbiIsDQo+IEBAIC05MTgsMTggKzkxMyw2IEBAIHN0YXRpYyB2b2lkIHNldF92bV9jb250
ZXh0X3BhZ2VfdGFibGVfYmFzZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1aW50MzJfdCB2bWlkLA0K
PiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgDQo+IC0JLyogVE9ETzogdGFrZSBhZHZhbnRhZ2Ug
b2YgcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZSBzaXplLiBGb3INCj4gLQkgKiBub3csIGFsbCBw
cm9jZXNzZXMgc2hhcmUgdGhlIHNhbWUgYWRkcmVzcyBzcGFjZSBzaXplLCBsaWtlDQo+IC0JICog
b24gR0ZYOCBhbmQgb2xkZXIuDQo+IC0JICovDQo+IC0JV1JFRzMyKFNPQzE1X1JFR19PRkZTRVQo
R0MsIDAsIG1tR0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX1NUQVJUX0FERFJfTE8zMikgKyAodm1p
ZCoyKSwgMCk7DQo+IC0JV1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0NWTV9DT05U
RVhUMF9QQUdFX1RBQkxFX1NUQVJUX0FERFJfSEkzMikgKyAodm1pZCoyKSwgMCk7DQo+IC0NCj4g
LQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZNX0NPTlRFWFQwX1BBR0VfVEFC
TEVfRU5EX0FERFJfTE8zMikgKyAodm1pZCoyKSwNCj4gLQkJCWxvd2VyXzMyX2JpdHMoYWRldi0+
dm1fbWFuYWdlci5tYXhfcGZuIC0gMSkpOw0KPiAtCVdSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEdD
LCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9FTkRfQUREUl9ISTMyKSArICh2bWlkKjIp
LA0KPiAtCQkJdXBwZXJfMzJfYml0cyhhZGV2LT52bV9tYW5hZ2VyLm1heF9wZm4gLSAxKSk7DQo+
IC0NCj4gLQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZNX0NPTlRFWFQwX1BB
R0VfVEFCTEVfQkFTRV9BRERSX0xPMzIpICsgKHZtaWQqMiksIGxvd2VyXzMyX2JpdHMoYmFzZSkp
Ow0KPiAtCVdSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFH
RV9UQUJMRV9CQVNFX0FERFJfSEkzMikgKyAodm1pZCoyKSwgdXBwZXJfMzJfYml0cyhiYXNlKSk7
DQo+ICsJLyogU0RNQSBpcyBvbiBnZnhodWIgYXMgd2VsbCBvbiBOYXZpMSogc2VyaWVzICovDQo+
ICsJZ2Z4aHViX3YyXzBfc2V0dXBfdm1fcHRfcmVncyhhZGV2LCB2bWlkLCBwYWdlX3RhYmxlX2Jh
c2UpOw0KPiAgIH0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
