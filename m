Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B582D44DF
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 18:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8D6EC59;
	Fri, 11 Oct 2019 16:02:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207746EC59
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 16:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwyx0Waphma+a63X49avf+bcyDqoA2KfS6sH3SDRd1ruC/cnho3QHgBGN3eyhQjzn9xOdFEcXhYH9QrrdeCwlMT6oQbXGGBmHlwRT7lM76qWBUpbDAAhD1cwmILkzH3WKdbLJFjmIWbssXl37G9Y1EQW+M+CiRxGDaVRGsDCUBGTvRbLoi7APQpZmWy31YAthGZMN81pyEQCUWco8jpooCKr87XnHe+iklM+rdRjSz+8xCVhLwVWbuVUoWFeElWoEiacQGWLFEH9QNdYnEvFb7Fpw47CHJ7N/ZLGCWUpB+iQBqM8vzSOAu//l3yi3q4Pa/FE4mG4ErnR8H1Ad6l7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZJDiLeI6yvfG17g2Hs4hKNARLUwzrJbtLptn6NHcSg=;
 b=YgH/g+ydqUoXwqrGRFuVKsN49jY4652n46xoIYCRnhaHM125uWbJ3dyAhnNaR4VNxwrngX6bRg2rVrYivD/qo9ZGm06UaQ8qgVbshSSRwUsrIgjXB7t731bcVGkqbffUCNzWTno9jwUwac6xi8JxjLs3T8r000+JNf9vgdcctaSAEq2q/xsBahWq5GleQgWZ12AJ54jkHWAUN9TJfIUg4NvXvgz0nqu9z9DdS3/sw2uDQawgpX+lkeMdQFPuvyT8KJNwfruoiBGCFeCy1asHU4DFG5LzM+6iHhbuWbRset1x0Cqb7UoK36jdy+JaydL1bMYooQLHu6Y3aYF/DSDkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0232.namprd12.prod.outlook.com (10.174.52.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 16:01:58 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 16:01:58 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 00/26] Renoir DC Patches
Thread-Topic: [PATCH 00/26] Renoir DC Patches
Thread-Index: AQHVfuVoUae5HNc7hUK4JPns6Pm8QadVnJ4A
Date: Fri, 11 Oct 2019 16:01:58 +0000
Message-ID: <97eeb548-811e-2049-7bcd-e3d30bd62f3c@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fe09a05-3113-475b-bbdd-08d74e645864
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB023238FE21F13B9B45628F988C970@CY4PR1201MB0232.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(199004)(189003)(53754006)(6512007)(36756003)(2906002)(66066001)(486006)(476003)(65956001)(31696002)(65806001)(58126008)(11346002)(2616005)(25786009)(110136005)(54906003)(316002)(446003)(6246003)(7736002)(305945005)(6116002)(6436002)(3846002)(6486002)(256004)(14444005)(229853002)(4326008)(66476007)(66556008)(8936002)(8676002)(81166006)(6506007)(81156014)(5660300002)(66946007)(71190400001)(71200400001)(99286004)(478600001)(66446008)(31686004)(52116002)(64756008)(386003)(102836004)(186003)(76176011)(53546011)(26005)(2501003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0232;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O27xtbfLCknlEaBJt/s0ar66dgOJLXc2zJPh5SqFpRrcMjOY3pC3siQPcR2EUmQ+dgKgmEr+8SssyHjKpthFCmkWzjhqM/LULWAY8tZs7XRYhnTa0aYtRKydd6+/0CBeYYGuFlSdU+8ko0aFCXbubcktn7R4CCcThnjxwHDlhN25O7oA+XrnbCpOtS9LjIRcX7aeIPggETvHtC2vQh/rMbReTHF7bK4ai56N8/ZwrIfB27hkdeEpwnKNIECnC7kQKY9fuAyr0DDiAQod6+08GERJ0YB/Am5bjEUaduBvN5Zlata0E3zJJWnFGTbIkw6OK+ljFdW7j82l1j4fSLJWvJUB1d3qfDMurUx5xjLztzfN49vy5WnML3iWeC5v3CYUimPjZ4U/c0lCVTBiayF1nr/Spp5tQmFKsHfTQbUVez0=
Content-ID: <89C36B07D53087438ED72F573189C599@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe09a05-3113-475b-bbdd-08d74e645864
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 16:01:58.5396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RrzFguwYaSLRemapK0NObjROlFEGC5+C7WhIr8Qzo1mHpIrM/3DsnWTC09srsNtM2wGWfpo+sA8fmKoCiuXG3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZJDiLeI6yvfG17g2Hs4hKNARLUwzrJbtLptn6NHcSg=;
 b=tUW4IL/fHGV9EeNesaqPn3IkRvrqRq+CMEMbT7KSRbuAxaLMINW2tTqxGIcjl5xawEDQWkkB4zt6ILY2xfJa+7LK8LuW5cq4A2C85a3Sp2uTO0S7ikXJq6WYPaIcU4ZpUPiTKXRPbHaTeuf3QxjAcUPA2C0lTQUM9kKhyXCsQ14=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQpBY2tlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+DQoNCkhhcnJ5DQoNCk9uIDIwMTktMTAtMDkgNTowNSBwLm0uLCBCaGF3YW5wcmVldCBMYWto
YSB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gVGhlcmUgd2FzIGEgZGVsdGEgYmV0d3dlbiBpbnRl
cm5hbCBkY24yMSBjb2RlIGFuZCB1cHN0cmVhbSBkY24yMSBjb2RlLg0KPiBUaGVzZSBjaGFuZ2Vz
IGJyaW5nIHRoZW0gaW5saW5lLg0KPiANCj4gDQo+IFN1bW1hcnkgb2YgQ2hhbmdlcw0KPiAqQWRk
IFJOIHJlZ2lzdG9ycw0KPiAqQWRkIGRjbjEyIGh3c2VxIGFuZCBsaW5rX2VuY29kZXINCj4gKlJO
IHNwZWNpZmljIGZpeGVzDQo+ICphdXggdGltZW91dCBzdXBwb3J0DQo+ICpib3VuZGluZyBib3gg
Y2hhbmdlcw0KPiANCj4gQmhhd2FucHJlZXQgTGFraGEgKDEyKToNCj4gICBkcm0vYW1kL2Rpc3Bs
YXk6IEFkZCBEUF9EUEhZX0lOVEVSTkFMX0NUUiByZWdzDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBB
ZGQgRENOX0JBU0UgcmVncw0KPiAgIGRybS9hbWQvZGlzcGxheTogQWRkIHJlbm9pciBod19zZXEN
Cj4gICBkcm0vYW1kL2Rpc3BsYXk6IGNyZWF0ZSBkY24yMV9saW5rX2VuY29kZXIgZmlsZXMNCj4g
ICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBSRUZDWUNfUEVSX1RSSVBfVE9fTUVNT1JZIHByb2dyYW1t
aW5nDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBmaXggaW5jb3JyZWN0IHBhZ2UgdGFibGUgYWRkcmVz
cyBmb3IgcmVub2lyDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgZGV0aWxlIGJ1ZmZlciBzaXpl
IGZvciByZW5vaXINCj4gICBkcm0vYW1kL2Rpc3BsYXk6IHVwZGF0ZSBkY24yMSBodWJidWIgcmVn
aXN0ZXJzDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiB1cGRhdGUgcmVub2lyIGJvdW5kaW5nIGJveCBh
bmQgcmVzX2NhcHMNCj4gICBkcm0vYW1kL2Rpc3BsYXk6IGNoYW5nZSBQUF9TTSBkZWZzIHRvIDgN
Cj4gICBkcm0vYW1kL2Rpc3BsYXk6IGhhbmRsZSAiMTgiIGNhc2UgaW4gVHJ1bmNUb1ZhbGlkQlBQ
DQo+ICAgZHJtL2FtZC9kaXNwbGF5OiB1c2UgcmVxdWVzdGVkX2Rpc3BjbGtfa2h6IGluc3RlYWQg
b2YgY2xrDQo+IA0KPiBEbXl0cm8gTGFrdHl1c2hraW4gKDQpOg0KPiAgIGRybS9hbWQvZGlzcGxh
eTogZW5hYmxlIGhvc3R2bSBiYXNlZCBvbiByb2ltbXUgYWN0aXZlIGZvciBkY24yLjENCj4gICBk
cm0vYW1kL2Rpc3BsYXk6IGluaXRpYWxpemUgUk4gZ3B1dm0gY29udGV4dCBwcm9ncmFtbWluZyBm
dW5jdGlvbg0KPiAgIGRybS9hbWQvZGlzcGxheTogY29ycmVjdCBkY24yMSBOVU1fVk1JRCB0byAx
Ng0KPiAgIGRybS9hbWQvZGlzcGxheTogdXBkYXRlIG9kbSBtb2RlIHZhbGlkYXRpb24gdG8gYmUg
aW4gbGluZSB3aXRoIHBvbGljeQ0KPiANCj4gRXJpYyBZYW5nICgyKToNCj4gICBkcm0vYW1kL2Rp
c3BsYXk6IHVzZSBkY24xMCB2ZXJzaW9uIG9mIHByb2dyYW0gdGlsaW5nIG9uIFJlbm9pcg0KPiAg
IGRybS9hbWQvZGlzcGxheTogYWRkIHNhbml0eSBjaGVjayBmb3IgY2xrIHRhYmxlIGZyb20gc211
DQo+IA0KPiBMZXdpcyBIdWFuZyAoMyk6DQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBtb3ZlIHRoZSBi
b3VuZGluZyBib3ggcGF0Y2ggYmVmb3JlIGNhbGN1bGF0ZSB3bQ0KPiAgIGRybS9hbWQvZGlzcGxh
eTogVGVtcG9yYXJ5IHdvcmthcm91bmQgdG8gdG9nZ2xlIHdhdGVybWFyayBzZXR0aW5nDQo+ICAg
ZHJtL2FtZC9kaXNwbGF5OiBlbmFibGUgc211IHNldCBkY2ZjbGsNCj4gDQo+IE1pY2hhZWwgU3Ry
YXVzcyAoMSk6DQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBGaXggcm4gYXVkaW8gcGxheWJhY2sgYW5k
IHZpZGVvIHBsYXliYWNrIHNwZWVkDQo+IA0KPiBTdW5nIExlZSAoMSk6DQo+ICAgZHJtL2FtZC9k
aXNwbGF5OiBhZGQgZHVtbXkgZnVuY3Rpb25zIHRvIHNtdSBmb3IgUmVub2lyIFNpbGljb24gRGlh
Z3MNCj4gDQo+IGFiZG91bGF5ZSBiZXJ0aGUgKDIpOg0KPiAgIGRybS9hbWQvZGlzcGxheTogdXBk
YXRlIHJlZ2lzdGVyIGZpZWxkIGFjY2VzcyBtZWNoYW5pc20NCj4gICBkcm0vYW1kL2Rpc3BsYXk6
IGNvbmZpZ3VyYWJsZSBhdXggdGltZW91dCBzdXBwb3J0DQo+IA0KPiBqb3NlcGggZ3JhdmVub3Ig
KDEpOg0KPiAgIGRybS9hbWQvZGlzcGxheTogZml4IGhlYWRlciBmb3IgUk4gY2xrIG1ncg0KPiAN
Cj4gIC4uLi9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8ICAyMyAr
LQ0KPiAgLi4uL2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyAgIHwgIDE5
ICstDQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMgfCAg
MTQgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwg
ICAyICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jICB8
ICA4MiArKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXgu
aCAgfCAxODcgKysrKysrKystDQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X2h3c2VxLmggICAgfCAgIDEgKw0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBf
cmVzb3VyY2UuYyAgIHwgIDE1ICstDQo+ICAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTEx
MF9yZXNvdXJjZS5jICAgfCAgMTQgKy0NCj4gIC4uLi9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNl
MTEyX3Jlc291cmNlLmMgICB8ICAxNSArLQ0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9k
Y2UxMjBfcmVzb3VyY2UuYyAgIHwgIDE1ICstDQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTgwL2RjZTgwX3Jlc291cmNlLmMgfCAgMTQgKy0NCj4gIC4uLi9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9od19zZXF1ZW5jZXIuYyB8ICAgNCArDQo+ICAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfbGlua19lbmNvZGVyLmggfCAgMzUgKy0NCj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYyB8ICAxNSArLQ0KPiAgLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgICA0ICsNCj4gIC4uLi9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuaCB8ICAgNyArDQo+ICAuLi4vZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAgMzEgKy0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZSB8ICAgMiArLQ0KPiAgLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYyAgIHwgMTE2ICsrKystLQ0KPiAgLi4uL2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuaCAgIHwgIDM0ICstDQo+ICAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJwLmMgfCAgIDQgKy0NCj4gIC4u
Li9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHdzZXEuYyAgICB8IDEyMiArKysrKysN
Cj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHdzZXEuaCAgICB8ICAzMyAr
Kw0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2xpbmtfZW5jb2Rlci5jIHwgMzg0
ICsrKysrKysrKysrKysrKysrKw0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2xp
bmtfZW5jb2Rlci5oIHwgIDUxICsrKw0KPiAgLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9k
Y24yMV9yZXNvdXJjZS5jIHwgMjY5ICsrKysrKysrKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oICAgIHwgICA2ICstDQo+ICAuLi4vZGMvZG1sL2RjbjIx
L2Rpc3BsYXlfbW9kZV92YmFfMjEuYyAgICAgICAgfCAgMTEgKy0NCj4gIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RkYy5oICB8ICAgMyArDQo+ICAuLi4vZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9pbmMvZGNfbGlua19kcC5oICAgfCAgIDIgKw0KPiAgLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9pbmMvaHcvYXV4X2VuZ2luZS5oICAgIHwgICAzICsNCj4gIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2luYy9ody9kY2h1YmJ1Yi5oICB8ICAgMSArDQo+ICAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbWVtX2lucHV0LmggfCAgIDEgKw0KPiAgLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3X3NlcXVlbmNlci5oIHwgICAzICsNCj4gIC4uLi9pbmNs
dWRlL2FzaWNfcmVnL2Rjbi9kY25fMl8xXzBfb2Zmc2V0LmggICB8ICAxMCArDQo+ICAuLi4vZ3B1
L2RybS9hbWQvaW5jbHVkZS9yZW5vaXJfaXBfb2Zmc2V0LmggICAgfCAgMzQgKysNCj4gIDM3IGZp
bGVzIGNoYW5nZWQsIDE0NjEgaW5zZXJ0aW9ucygrKSwgMTI1IGRlbGV0aW9ucygtKQ0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9od3NlcS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIxL2RjbjIxX2h3c2VxLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfbGlua19lbmNvZGVyLmMNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNu
MjFfbGlua19lbmNvZGVyLmgNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
