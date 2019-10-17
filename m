Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF9DAF09
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5A86E49B;
	Thu, 17 Oct 2019 14:03:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE806E492
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 14:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzKQ51LUZfIp/YREcpHk1lRpoF5uIEZmGLMkQSnZHBWmcu+GAce7/v2qImo/cTEaHMBc6kvZuUnA9BQl0VCFgdBt/bur4eK8PDvwBJVpFN2pWKpBWZweUhHEGRYe0ujv3C/Q6WmbijaOK/2Z9D5Zyrsb09DcxLMcDpynU/022wZFfgynSjs+DoNYQEZZb0lctpftCHZeh8+WMsOX6+c/ICA8mmppqL4HrH4z8gXnOpmXOcSNENG4mDdYnUZL7ZSPKyMCwiRf/0kWqjHB2F8na3fISpwvm6aoEAPe1zX0dcT4ozrKbs1Bagna9gE+cZkdEqZsN4LpAHLo4DFf/5S+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBM50HejktQDSvwm3U2aV3joHNjhlEQ5H6nCNV8KbRQ=;
 b=fRd/poOyITw/LXTwCNkdyx/6ZY9cKjcGv6piDCHtIUW9AS/awoKQ/nNW1M6IInRBN2MHjFXAn9L+UpnJ4pzs3VO24eTMjNeOlGe9dy0fbV+Qi+tTlSuykT/zVqHtG3+JDNxczMMPGRyN8zWz3E21arPdVYeN4a7trxQjpU/Fgmkj+lIbdtvRA6dyuu3ms8aAIeyQH702bDYnVghR25i/5mugkNlhF6ihYt5NL+65NVq/pfGB6fwAcAOp5VGNRQ8rM8hgecZIa0YyTCewaTlD1lJukjY1srWvbQBW6i8XxRbQhOpZ8XVkyRUM7ILLXptycAAVxQnNmKMZY4PMgDwGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB4299.namprd12.prod.outlook.com (10.141.8.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Thu, 17 Oct 2019 14:03:07 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 14:03:07 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Topic: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhKHEf7z6O+vtZ0KYLzN3Nfjkz6de1n+AgAAEqCA=
Date: Thu, 17 Oct 2019 14:03:07 +0000
Message-ID: <DM6PR12MB3466B905FBA40EE91536083B9E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
 <123d03bd-3c75-c4ad-522f-1f9c7ddae0a5@amd.com>
In-Reply-To: <123d03bd-3c75-c4ad-522f-1f9c7ddae0a5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b55701-06ab-445d-8b8f-08d7530abcc7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB4299:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4299B7AE322E37BD791765379E6D0@DM6PR12MB4299.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(13464003)(99286004)(74316002)(8936002)(305945005)(7736002)(486006)(55016002)(7696005)(6306002)(11346002)(66066001)(66446008)(66946007)(25786009)(6436002)(476003)(66476007)(66556008)(64756008)(76176011)(446003)(8676002)(76116006)(316002)(256004)(110136005)(6246003)(5660300002)(478600001)(86362001)(71190400001)(33656002)(229853002)(71200400001)(26005)(4001150100001)(52536014)(966005)(53546011)(2501003)(9686003)(81166006)(81156014)(3846002)(6116002)(186003)(2906002)(102836004)(6506007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4299;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lFo8Kkatw77wzduxIN1YnQhsw50hZ3xfwO6QnIqV/SsT6CoPbRHDgJbnnSF1YFAe090kCOuavKxGQ8y2pd7RR+66SOhGKuLeioBgFJa3thpCSTUZUefDstrGhJGlR0kqur6w3+BpNVnI7PuXr0jSH3gJDSt5gGRVCMVA1Pg8q6KuLdA5uwW/Z7v2ceGZfFOJtblvn9X5OLzrDx4UCHRlMOPWw//GaZBuJ5w+uJLTHg1We/LLL6Ui8jas8JBPsKOnkCZMn91aIwuCsSdOjfArqRrGK2aQx4Bd948TdUZdUNLKO8yxSapYDlQEXgVEUqjz7EpywJHLDPqL9A1af8JKZBFN9x7x71FPrNBy0+csJaBVXOFcaLyVvW1Gh/Sby5bqTq84m8I8rDDrEwYtGSncBxsdSMYlT7f8HM3RQOB2BKEKYLTMYQ6UWtS4GQx19R1BJNJ+oHTcZDy4WfvsNfEVFw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b55701-06ab-445d-8b8f-08d7530abcc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 14:03:07.6457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bjnIzqptfapYlBdzxiJTk4WhI1NmA24xoqxDl0np0yAgFkTLNcWetkMGWOlhxUn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBM50HejktQDSvwm3U2aV3joHNjhlEQ5H6nCNV8KbRQ=;
 b=LciILUv9wDejpCpuuHV3JWC2qN9hqnL7WLx/Lhe8tCIW4yncjmZvbg3gy3bNll+ZZJrjoOAc27SUz4aFClhruWqFgsNbjndP4VT4pkKUR9XgSlZi8G8XrYd6172U8oNLOYbV2GK8FtuwTPnRE6QSZYnW+qm4oiDz0jz4kjHYuqY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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

SW5saW5lLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthemxhdXNr
YXMsIE5pY2hvbGFzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+DQo+IFNlbnQ6IDIwMTkv
T2N0b2Jlci8xNywgVGh1cnNkYXkgOTozNyBBTQ0KPiBUbzogTGl1LCBaaGFuIDxaaGFuLkxpdUBh
bWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2FtZC9kaXNwbGF5OiBNb2RpZnkgZGlzcGxheSBsaW5rIHN0cmVhbSBzZXR1cA0K
PiBzZXF1ZW5jZS4NCj4gDQo+IE9uIDIwMTktMTAtMTcgMTI6MjggYS5tLiwgTGl1LCBaaGFuIHdy
b3RlOg0KPiA+IEZyb206IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQuY29tPg0KPiA+DQo+ID4gW1do
eV0NCj4gPiBXaGVuIGEgc3BlY2lmaWMga2luZCBvZiBjb25uZWN0b3IgaXMgZGV0ZWN0ZWQsDQo+
ID4gREMgbmVlZHMgdG8gc2V0IHRoZSBhdHRyaWJ1dGUgb2YgdGhlIHN0cmVhbS4NCj4gPiBUaGlz
IHN0ZXAgbmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUgZW5hYmxpbmcgbGluaywNCj4gPiBvciBzb21l
IGJ1Z3MgKGUuZy4gZGlzcGxheSB3b24ndCBsaWdodCB1cCkNCj4gPiB3aWxsIGJlIG9ic2VydmVk
Lg0KPiA+DQo+ID4gW0hvd10NCj4gPiBTZXR0aW5nIHRoZSBhdHRyaWJ1dGUgb2YgdGhlIHN0cmVh
bSBmaXJzdCwgdGhlbg0KPiA+IGVuYWJsaW5nIHN0cmVhbS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQuY29tPg0KPiANCj4gTkFLOg0KPiANCj4gMS4gSXQn
cyBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCB3aGF0IGlzc3VlIHRoaXMgY2hhbmdlIGlzIGF0dGVt
cHRpbmcgdG8NCj4gc29sdmUgYW5kIHdoeSBpdCBhY3R1YWxseSBkb2VzIGl0LiBTcGVjaWZpY3Mg
d291bGQgaGVscCBoZXJlLg0KDQpTb21lIG9mIHRoZSBkZXRhaWxzIGFyZSBJUC1zZW5zaXRpdmUs
IHRoYXQncyB3aHkgSSBjaG9vc2Ugbm90IHRvIGluY2x1ZGUgZGV0YWlscy4NCg0KPiANCj4gMi4g
SXQgYWZmZWN0cyBhIGNvbW1vbiBjb2RlIHBhdGggZm9yIGFsbCBBU0lDcyB3aGljaCBoYXMgYmVl
biB0ZXN0ZWQgYW5kDQo+IGtub3duIHRvIGJlIHdvcmtpbmcgY29ycmVjdGx5IGZvciB0aG9zZSB0
ZXN0IGNhc2VzLg0KDQpBcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLCBjb25zaWRlcmluZyBOYXZpMTAg
YW5kIE5hdmkxNCBhcmUgdXNpbmcgdGhlIHNhbWUgREMgY29kZSwgYW5kIHRoZSBpc3N1ZSBpcyBv
bmx5IGhhcHBlbmluZyBvbiBOYXZpMTQsIGl0cyBtb3JlIGxpa2VseSB0aGUgaXNzdWUgaXMgYSBC
SU9TIGlzc3VlLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRvIGZpeCBpdCBvbiBkaXNwbGF5IHNpZGUs
IHdlIGNhbiBvbmx5IGRvIHNvbWUga2luZHMgb2Ygd29ya2Fyb3VuZCB0byBmaXggaXQuIEFub3Ro
ZXIgYWx0ZXJuYXRpdmUgaXMgdG8gZG8gc3RyZWFtIHNldHVwIHR3aWNlLCBidXQgdGhlcmUgaXMg
bm8gcG9pbnQgdG8gcmVwZWF0IHRoZSBzZXR1cCB0d28gdGltZXMuIA0KDQpJZiB3ZSByZWFsbHkg
d29ycnkgYWJvdXQgYWxsIEFJU0NzIHdpbGwgYmUgaW5mbHVlbmNlZCwgd2UgY2FuIGd1YXJkIHRo
ZSBzZWN0aW9uIGFzIGEgTmF2aTE0IHNwZWNpZmljIGNvZGUsIGFuZCB0cmVhdCB0aGlzIHBhdGNo
IGFzIGEgImhhY2siLg0KDQo+IA0KPiAzLiBUaGUgZGVzY3JpcHRpb24gaXMgaW5jb3JyZWN0IC0g
dGhlIGxpbmsgZW5hYmxlL3N0cmVhbSBlbmFibGUgd2VyZQ0KPiBib3RoIHByZXZpb3VzbHkgaGFw
cGVuaW5nIGFmdGVyIHRoZSBzdHJlYW0gc2V0dXAuIFdoYXQncyBjaGFuZ2VkIGluIHRoZQ0KPiBw
YXRjaCBpcyB0aGUgbGluayBlbmFibGUgbm93IGhhcHBlbnMgYmVmb3JlIHRoZSBsaW5rIHNldHVw
Lg0KPiANCj4gQm90aCBvZiB0aGVzZSBjYWxscyBpbnRlcm5hbGx5IGdvIHRocm91Z2ggdGhlIGNv
bW1hbmQgdGFibGUgdG8gVkJJT1Mgc28NCj4gd2hhdCBiZWhhdmlvciBkaWZmZXJlbmNlcyB5b3Un
cmUgc2VlaW5nIG1heSBiZSBjYXVzZWQgYnkgdGhlIGlucHV0DQo+IHBhcmFtZXRlcnMgdG8gdGhl
IEFUT01fRU5DT0RFUl9DTURfU1RSRUFNX1NFVFVQIG9yDQo+IFRSQU5TTUlUVEVSX0NPTlRST0xf
RU5BQkxFIGNvbW1hbmRzIG9yIHRoZSBhY3R1YWwgZXhlY3V0aW9uIG9mDQo+IHRob3NlDQo+IGNv
bW1hbmRzLg0KPiANCj4gTmljaG9sYXMgS2F6bGF1c2thcw0KPiANCj4gPiAtLS0NCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDIwICsrKysrKysr
Ky0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMNCj4gPiBpbmRleCBmYjE4NjgxYjUwMmIuLjcxM2NhYWI4MjgzNyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMNCj4gPiBAQCAtMjc0NSwxNiArMjc0NSw2IEBAIHZvaWQgY29yZV9saW5rX2VuYWJsZV9z
dHJlYW0oDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGRjX2lzX3ZpcnR1YWxfc2lnbmFs
KHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpDQo+ID4gICAgICAgICAgICAgICAgICByZXR1cm47
DQo+ID4NCj4gPiAtICAgICAgIGlmICghZGNfaXNfdmlydHVhbF9zaWduYWwocGlwZV9jdHgtPnN0
cmVhbS0+c2lnbmFsKSkgew0KPiA+IC0gICAgICAgICAgICAgICBzdHJlYW0tPmxpbmstPmxpbmtf
ZW5jLT5mdW5jcy0+c2V0dXAoDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RyZWFtLT5s
aW5rLT5saW5rX2VuYywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwaXBlX2N0eC0+c3Ry
ZWFtLT5zaWduYWwpOw0KPiA+IC0gICAgICAgICAgICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5z
dHJlYW1fZW5jLT5mdW5jcy0+c2V0dXBfc3RlcmVvX3N5bmMoDQo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+aW5zdCwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICBzdHJlYW0tPnRpbWluZy50aW1pbmdfM2RfZm9ybWF0ICE9DQo+IFRJ
TUlOR18zRF9GT1JNQVRfTk9ORSk7DQo+ID4gLSAgICAgICB9DQo+ID4gLQ0KPiA+ICAgICAgICAg
IGlmIChkY19pc19kcF9zaWduYWwocGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKSkNCj4gPiAgICAg
ICAgICAgICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLQ0KPiA+
ZHBfc2V0X3N0cmVhbV9hdHRyaWJ1dGUoDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHBp
cGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsDQo+ID4gQEAgLTI4NDEsNiArMjgzMSwxNiBA
QCB2b2lkIGNvcmVfbGlua19lbmFibGVfc3RyZWFtKA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQ09OVFJPTExFUl9EUF9URVNUX1BBVFRFUk5fVklERU9NT0RF
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ09MT1JfREVQ
VEhfVU5ERUZJTkVEKTsNCj4gPg0KPiA+ICsgICAgICAgICAgICAgICBpZiAoIWRjX2lzX3ZpcnR1
YWxfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBzdHJlYW0tPmxpbmstPmxpbmtfZW5jLT5mdW5jcy0+c2V0dXAoDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJlYW0tPmxpbmstPmxpbmtfZW5jLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFs
KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJl
YW1fZW5jLT5mdW5jcy0NCj4gPnNldHVwX3N0ZXJlb19zeW5jKA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5p
bnN0LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyZWFtLT50aW1pbmcu
dGltaW5nXzNkX2Zvcm1hdCAhPQ0KPiBUSU1JTkdfM0RfRk9STUFUX05PTkUpOw0KPiA+ICsgICAg
ICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICAgI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19T
VVBQT1JUDQo+ID4gICAgICAgICAgICAgICAgICBpZiAocGlwZV9jdHgtPnN0cmVhbS0+dGltaW5n
LmZsYWdzLkRTQykgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGNfaXNfZHBf
c2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkgfHwNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KPiA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
