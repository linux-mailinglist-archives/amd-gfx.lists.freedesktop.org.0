Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A0F39AB
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Nov 2019 21:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9076F7A9;
	Thu,  7 Nov 2019 20:42:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700053.outbound.protection.outlook.com [40.107.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8A56F7A9
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Nov 2019 20:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGrNuwcfog1eIpYdHbto7ulXjeF5e5Yit3XIs4wcO14FP6egKM3ySqgJcTKwTpcYUnv+OwvaCsDnPFe0lHRK7wMZCd8+sPjJJHRE0Aai18K3FoiF6bW/99XPL8hdIlTXLB3YEmEhkyKOgxWRMmLqB2elkXaHYaEuIS6hLFwUcscF9v+X1hVGkpPXf0TS5EBXRmhe1bGJ0iq78N2rOkloWQCl7byK6JALYZXgleg1Zlb95xJbI8WjL8HYUP0P0s9mbln72QfeFlR9aZQDKnqGfuHKlO9OIeW5KV8PV7vQvkppALtCHOOHxT70ENZvyCwatn9UCMUnHey1cQR9ke0+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKo1c+3yu+FWtt2HRpeG5OrEPDlSNyG0ZSPBmdgK8R0=;
 b=jVA9siTrV75X0FsalpLtW3RODGGJXVcvKYblpyAeStrspXYWmu7Z2m59sriCqjVs+z0h9d8PWhBLyqVNaKnoLeMVLdmNKv2A7QNjqRL/pWFD6I3RDHiaIEyYMJZ37ngyjuEbM9EB6Zg/dzJ25NMEthWzIVUm4hyatRKdN0ZfXC0O7gP7tkW89QP9OF/1ZlD40FkzTk+pF2UtsTghsLN8T/22nMC6PjHE4tz5xOuqJuJm536RFBoWhMEPUXkegqWw/RqvXj6/dBJOSbEMTZsOWIxl8z86s8oyf7vIvtaYE6+CG+lZcenRIPqo3DZab+1b0KMllAnPrhf+Ac98Faae/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3498.namprd12.prod.outlook.com (20.178.30.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 20:42:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede%4]) with mapi id 15.20.2408.024; Thu, 7 Nov 2019
 20:42:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/3] drm/amdkfd: only keep release_mem function for Hawaii
Thread-Topic: [PATCH 2/3] drm/amdkfd: only keep release_mem function for Hawaii
Thread-Index: AQHVj4Cnk6bDefnEn0qwGZufIzY7Wqd/LUeAgADMdQCAAAovgIAAAc4AgAACFYCAAAyIAIAAJHYA
Date: Thu, 7 Nov 2019 20:42:44 +0000
Message-ID: <cec95a43-d4a8-9d65-b5fc-9e31273c988f@amd.com>
References: <20191031001739.10764-1-Yong.Zhao@amd.com>
 <20191031001739.10764-2-Yong.Zhao@amd.com>
 <31102345-20f7-1b0e-dd2a-f7984b253a07@amd.com>
 <DM6PR12MB2778C141CFEA0006DA2CEC6DF0780@DM6PR12MB2778.namprd12.prod.outlook.com>
 <CY4PR1201MB2533087B346C4619F461FF3185780@CY4PR1201MB2533.namprd12.prod.outlook.com>
 <41a6b535-ab7a-44f4-2899-f211f5ddc296@amd.com>
 <85fd399c-5fa9-bdef-cdf6-433e80ba6407@amd.com>
 <CADnq5_Og4AWKdYFpa8hvmd2XXjr1Wzb_a26gqsq1H6c7NkWmMA@mail.gmail.com>
In-Reply-To: <CADnq5_Og4AWKdYFpa8hvmd2XXjr1Wzb_a26gqsq1H6c7NkWmMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [142.116.193.252]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa652277-ea13-4332-db24-08d763c30abe
x-ms-traffictypediagnostic: DM6PR12MB3498:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34980C8F221DFC57C93F1D3292780@DM6PR12MB3498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(189003)(199004)(51444003)(25786009)(31686004)(186003)(86362001)(36756003)(53546011)(66446008)(52116002)(386003)(7736002)(6506007)(5660300002)(316002)(99286004)(66946007)(66556008)(66476007)(966005)(58126008)(14454004)(76176011)(6116002)(305945005)(30864003)(6916009)(81166006)(3846002)(1411001)(478600001)(81156014)(229853002)(54906003)(6246003)(6306002)(6512007)(6486002)(71200400001)(8936002)(71190400001)(64756008)(8676002)(486006)(256004)(66066001)(65806001)(65956001)(31696002)(26005)(4326008)(11346002)(2616005)(4001150100001)(446003)(102836004)(6436002)(2906002)(14444005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3498;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NWwWQa9EzN1aS+yhvTMtu4QI8nbWNII3BACeNuh6qdIOpbbv0P47wYzL5TitCxJC59r4sIuxyDhPAy/+KTcDFz1ivfyHyuq0m3fCJz/BJjIENUGRS3qSzpQyrJA+MdZs50r33Hq15b1qoyBkZ9KsNWuA3IojREo7vhNmoz9hV+S0BF/E4NejgxeKEQXqKMJPxPRoWs0PpNQ2TNZUfLrBKQBn0FPvXyE4mO0eavJFMfP3+Ry8Jrx+KueLx5m0nGckh1J3YLXadgZbsEFwWjLEO0/VaUn4003XY0pkAGSSDu9MoubZY0tDg8LhLcnQz3TV2iAb/4cIZFv9Mtzq9XvFnC13f4mCcZvoxcBi7RDrojFETd8dsRAvoYIO4BiwtNE5jq05rg4ESGP9SGBP9a6LuVCsoZ7DsitYDm0L9zEGx5pjvbjwPI7PAtDQCjH7sdLWfsKDx+NLrBH8uAKo2rabpG+lov0xrkQdD8OT+vhTvn0=
Content-ID: <971CC26B38AF774ABC0AB62F529844E2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa652277-ea13-4332-db24-08d763c30abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 20:42:44.8595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAumRLgqyQ4pr+7h0aO+k+49BV+5mUesEuPGK78PYsDbeUKwEGcrH5IlHa9bk2DD8Bf02B8k6MOlQEchG5Luzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKo1c+3yu+FWtt2HRpeG5OrEPDlSNyG0ZSPBmdgK8R0=;
 b=IojRdZfFPQyKFLv8rqhg5La7cxj65kXpz0/klSiFlniIfl8OmH9T66ImxhpbKR8DXY9aR65nkHgdQeeYSiTrA8KGOJEqBdbbGoeD4dBgwjLG8AUjcSeLReIDTJKvDpFdGX6hXqYvWpfHyXlvXW1r+S54FknZ3HLHyx63tPK5YOM=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wNyAxMzozMiwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBPbiBUaHUsIE5vdiA3
LCAyMDE5IGF0IDEyOjQ3IFBNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4gd3JvdGU6DQo+PiBObywgcGxlYXNlIGxldHMgbm90IGFkZCBhIG5ldyBub21lbmNsYXR1cmUg
Zm9yIFBNNCBwYWNrZXQgdmVyc2lvbnMuIEdGWCB2ZXJzaW9ucyBhcmUgYWdyZWVkIG9uIGJldHdl
ZW4gaGFyZHdhcmUsIGZpcm13YXJlLCBhbmQgc29mdHdhcmUgYW5kIGl0J3MgZ2VuZXJhbGx5IHVu
ZGVyc3Rvb2Qgd2hhdCB0aGV5IG1lYW4uIElmIHdlIGFkZCBhIG5ldyBQTTQgcGFja2V0IHZlcnNp
b25pbmcgc2NoZW1lIG9uIG91ciBvd24sIHRoZW4gdGhpcyB3aWxsIGFkZCBhIGxvdCBvZiBjb25m
dXNpb24gd2hlbiB0YWxraW5nIHRvIGZpcm13YXJlIHRlYW1zLg0KPj4NCj4+IFlvdSBrbm93LCB0
aGlzIHdvdWxkIGFsbCBiZSBtb3JlIHN0cmFpZ2h0IGZvcndhcmQgaWYgd2UgYWNjZXB0ZWQgYSBs
aXR0bGUgYml0IG9mIGNvZGUgZHVwbGljYXRpb24gYW5kIGhhZCBwYWNrZXQgd3JpdGluZyBmdW5j
dGlvbnMgcGVyIEdGWCB2ZXJzaW9uLiBZb3UnbGwgc2VlIHRoaXMgcGF0dGVybiBhIGxvdCBpbiB0
aGUgYW1kZ3B1IGRyaXZlciB3aGVyZSBlYWNoIElQIHZlcnNpb24gZHVwbGljYXRlcyBhIGJ1bmNo
IG9mIGNvZGUuIEluIG1hbnkgY2FzZXMgeW91IG1heSBiZSBhYmxlIHRvIHNhdmUgYSBmZXcgbGlu
ZXMgb2YgY29kZSBieSBzaGFyaW5nIGZ1bmN0aW9ucyBiZXR3ZWVuIElQIHZlcnNpb25zLiBCdXQg
eW91J2xsIGFkZCBzb21lIGNvbmZ1c2lvbiBhbmQgYnVyZGVuIG9uIGZ1dHVyZSBtYWludGVuYW5j
ZS4NCj4+DQo+PiBUaGlzIGlzIHRoZSBwcmljZSB3ZSBwYXkgZm9yIG1pY3JvLW9wdGltaXppbmcg
bWlub3IgY29kZSBkdXBsaWNhdGlvbi4NCj4gV2hhdCB3ZSd2ZSB0cmllZCB0byBkbyBpbiBhbWRn
cHUgaXMgdG8gYnJlYWsgb3V0IHNoYXJlZCBjb2RlIGluIHRvDQo+IGNvbW1vbiBoZWxwZXJzIHRo
YXQgYXJlIG5vdCBJUCBzcGVjaWZpYyBhbmQgdXNlIHRoYXQgaW4gZWFjaCBJUCBtb2R1bGUNCj4g
KGUuZy4sIGFtZGdwdV91dmQuYyBhbWRncHVfZ2Z4LmMsIGV0Yy4pLiAgU29tZXRpbWVzIHdlIGNh
biB1c2UgYQ0KPiBwYXJ0aWN1bGFyIGNodW5rIG9mIGNvZGUgYWNyb3NzIG11bHRpcGxlIGdlbmVy
YXRpb25zLiAgRS5nLiwgdGhlIHV2ZA0KPiBzdHVmZiBpcyBhIGdvb2QgZXhhbXBsZS4gIFdlIGhh
dmUgc2hhcmVkIGdlbmVyaWMgdXZkIGhlbHBlcnMgdGhhdCB3b3JrDQo+IGZvciBtb3N0IFVWRCBJ
UCB2ZXJzaW9ucywgYW5kIHRoZW4gaWYgd2UgbmVlZCBhbiBJUCBzcGVjaWZpYyB2ZXJzaW9uLA0K
PiB3ZSBvdmVycmlkZSB0aGF0IGluIHRoZSBjYWxsYmFja3Mgd2l0aCBhIHZlcnNpb24gc3BlY2lm
aWMgb25lLiAgRS5nLiwNCj4gZm9yIHRoZSB2aWRlbyBkZWNvZGUgZW5naW5lcyB3ZSB1c2UgdGhl
IGdlbmVyaWMgaGVscGVycyBmb3IgYSBudW1iZXINCj4gb2YgcmluZyBmdW5jdGlvbnM6DQo+DQo+
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdXZkX3Y3XzBfcmluZ192bV9m
dW5jcyA9IHsNCj4gLi4uDQo+ICAgICAgLnRlc3RfcmluZyA9IHV2ZF92N18wX3JpbmdfdGVzdF9y
aW5nLA0KPiAgICAgICAgICAudGVzdF9pYiA9IGFtZGdwdV91dmRfcmluZ190ZXN0X2liLA0KPiAg
ICAgICAgICAuaW5zZXJ0X25vcCA9IHV2ZF92N18wX3JpbmdfaW5zZXJ0X25vcCwNCj4gICAgICAg
ICAgLnBhZF9pYiA9IGFtZGdwdV9yaW5nX2dlbmVyaWNfcGFkX2liLA0KPiAgICAgICAgICAuYmVn
aW5fdXNlID0gYW1kZ3B1X3V2ZF9yaW5nX2JlZ2luX3VzZSwNCj4gICAgICAgICAgLmVuZF91c2Ug
PSBhbWRncHVfdXZkX3JpbmdfZW5kX3VzZSwNCj4gLi4uDQo+IH07DQo+DQo+IHdoaWxlIHdlIG92
ZXJyaWRlIG1vcmUgb2YgdGhlbSBmb3IgdGhlIHZpZGVvIGVuY29kZSBlbmdpbmVzOg0KPg0KPiBz
dGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHV2ZF92N18wX2VuY19yaW5nX3Zt
X2Z1bmNzID0gew0KPiAuLi4NCj4gICAgICAudGVzdF9yaW5nID0gdXZkX3Y3XzBfZW5jX3Jpbmdf
dGVzdF9yaW5nLA0KPiAgICAgICAgICAudGVzdF9pYiA9IHV2ZF92N18wX2VuY19yaW5nX3Rlc3Rf
aWIsDQo+ICAgICAgICAgIC5pbnNlcnRfbm9wID0gYW1kZ3B1X3JpbmdfaW5zZXJ0X25vcCwNCj4g
ICAgICAuaW5zZXJ0X2VuZCA9IHV2ZF92N18wX2VuY19yaW5nX2luc2VydF9lbmQsDQo+ICAgICAg
ICAgIC5wYWRfaWIgPSBhbWRncHVfcmluZ19nZW5lcmljX3BhZF9pYiwNCj4gICAgICAgICAgLmJl
Z2luX3VzZSA9IGFtZGdwdV91dmRfcmluZ19iZWdpbl91c2UsDQo+ICAgICAgICAgIC5lbmRfdXNl
ID0gYW1kZ3B1X3V2ZF9yaW5nX2VuZF91c2UsDQo+IC4uLg0KPiB9Ow0KPg0KPiBCdXQgc3RpbGwg
bWFpbnRhaW4gSVAgc3BlY2lmaWMgY29tcG9uZW50cy4NCg0KVGhhbmtzIEFsZXguIEluIHRoaXMg
Y2FzZSB0aGUgY29tbW9uIGNvZGUgaXMgaW4ga2ZkX3BhY2tldF9tYW5hZ2VyLmMgYW5kIA0KdGhl
IElQLXZlcnNpb24tc3BlY2lmaWMgY29kZSB0aGF0IHdyaXRlcyB0aGUgYWN0dWFsIFBNNCBwYWNr
ZXRzIGlzIGluIA0KdGhlIGtlcm5lbF9xdWV1ZV92Ki5jIGZpbGVzLiBZb25nIGlzIHRyeWluZyB0
byBtZXJnZSB0aGUgUE00IHBhY2tldCANCndyaXRpbmcgY29kZSBmb3IgdjkgYW5kIHYxMCBiZWNh
dXNlIHRoZSBwYWNrZXQgZm9ybWF0cyBhcmUgZXNzZW50aWFsbHkgDQp1bmNoYW5nZWQuIEl0IG1h
a2VzIHRoZSBuYW1pbmcgY29udmVudGlvbnMgaW4gdGhlIGNvZGUgYSBiaXQgbWVhbmluZ2xlc3Mg
DQpiZWNhdXNlIHY5IG5vdyByZWFsbHkgbWVhbnMgInY5IGFuZCB2MTAiLiBBcHBhcmVudGx5IHRo
ZXJlIGlzIHByZWNlZGVudCANCmZvciB0aGlzLCBhcyB3ZSBhbHJlYWR5IGRpZCB0aGUgc2FtZSB0
aGluZyB3aXRoIHY3IGFuZCB2OCwgd2hpY2ggSSANCmZvcmdvdCBhYm91dCBpbiBteSBpbml0aWFs
IGNvZGUgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPg0KPiBBbGV4DQo+DQo+
PiBSZWdhcmRzLA0KPj4gICAgRmVsaXgNCj4+DQo+PiBPbiAyMDE5LTExLTA3IDEyOjM5LCBaaGFv
LCBZb25nIHdyb3RlOg0KPj4NCj4+IEhpIEtlbnQsDQo+Pg0KPj4gSSBjYW4ndCBhZ3JlZSBtb3Jl
IG9uIHRoaXMuIEFsc28sIHRoZSBzYW1lIGFwcGxpZXMgdG8gdGhlIGZpbGUgbmFtZXMuIERlZmlu
aXRlbHkgd2UgbmVlZCB0byBhZ3JlZSBvbiB0aGUgbmFtaW5nIHNjaGVtZSBiZWZvcmUgbWFraW5n
IGl0IGhhcHBlbi4NCj4+DQo+PiBZb25nDQo+Pg0KPj4gT24gMjAxOS0xMS0wNyAxMjozMyBwLm0u
LCBSdXNzZWxsLCBLZW50IHdyb3RlOg0KPj4NCj4+IEkgdGhpbmsgdGhhdCB0aGUgdmVyc2lvbmlu
ZyBpcyBnZXR0aW5nIGEgbGl0dGxlIGNvbmZ1c2luZyBzaW5jZSB3ZeKAmXJlIHVzaW5nIHRoZSBv
bGQgR0ZYIHZlcnNpb25zLCBidXQgbm90IHJlYWxseSBzdGlja2luZyB0byBpdCBkdWUgdG8gdGhl
IHNoYXJlYWJpbGl0eSBvZiBjZXJ0YWluIG1hbmFnZXJzIGFuZCBzaGFkZXJzLiBDb3VsZCB3ZSBs
b29rIGludG8gZG9pbmcgc29tZXRoaW5nIGxpa2UgZ2VuMSBvciBnZW4yLCBvciBzb21lIG90aGVy
IG1vcmUgYW1iaWd1b3VzIG5vbi1HRlgtcmVsYXRlZCB2ZXJzaW9uaW5nPyBPdGhlcndpc2Ugd2Xi
gJlsbCBrZWVwIGhhdmluZyB0aGVzZSBxdWVzdGlvbnMgb2Yg4oCcd2h5IGlzIEhhd2FpaSBHRlg4
4oCdLCDigJx3aHkgaXMgQXJjdHVydXMgR0ZYOeKAnSwgZXRjLiBUaGVuIGlmIHRoaW5ncyBjaGFu
Z2UsIHdlIGp1c3QgdXAgdGhlIHZhbHVlIGNvbmNyZXRlbHksIGluc3RlYWQgb2YgbWF5YmUgZG9p
bmcgYSB2MTEgaWYgR0ZYMTEgY2hhbmdlcyB0aGluZ3MsIGFuZCBvbmx5IEdGWDExIEFTSUNzIHVz
ZSB0aG9zZSBmdW5jdGlvbnMvdmFyaWFibGVzLg0KPj4NCj4+DQo+Pg0KPj4gT2J2aW91c2x5IG5v
dCBoaWdoLXByaW9yaXR5LCBidXQgbWF5YmUgc29tZXRoaW5nIHRvIGNvbnNpZGVyIGFzIHlvdSBj
b250aW51ZSB0byBjb25zb2xpZGF0ZSBhbmQgcmVtb3ZlIGR1cGxpY2F0ZSBjb2RlLg0KPj4NCj4+
DQo+Pg0KPj4gS2VudA0KPj4NCj4+DQo+Pg0KPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW8sIFlvbmcNCj4+IFNl
bnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA3LCAyMDE5IDExOjU3IEFNDQo+PiBUbzogS3VlaGxpbmcs
IEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm0vYW1ka2ZkOiBvbmx5IGtlZXAg
cmVsZWFzZV9tZW0gZnVuY3Rpb24gZm9yIEhhd2FpaQ0KPj4NCj4+DQo+Pg0KPj4gSGkgRmVsaXgs
DQo+Pg0KPj4NCj4+DQo+PiBUaGF0J3MgYmVjYXVzZSB2OCBhbmQgdjcgc2hhcmUgdGhlIHNhbWUg
cGFja2V0X21hbmFnZXJfZnVuY3MuIEluIHRoaXMgY2FzZSwgaXQgaXMgYmV0dGVyIHRvIGtlZXAg
aXQgYXMgaXQgaXMuDQo+Pg0KPj4NCj4+DQo+PiBSZWdhcmRzLA0KPj4NCj4+IFlvbmcNCj4+DQo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4NCj4+IEZyb206IEt1ZWhsaW5n
LCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IFNlbnQ6IFdlZG5lc2RheSwgTm92
ZW1iZXIgNiwgMjAxOSAxMTo0NSBQTQ0KPj4gVG86IFpoYW8sIFlvbmcgPFlvbmcuWmhhb0BhbWQu
Y29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPg0KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGRybS9hbWRrZmQ6IG9ubHkg
a2VlcCByZWxlYXNlX21lbSBmdW5jdGlvbiBmb3IgSGF3YWlpDQo+Pg0KPj4NCj4+DQo+PiBPbiAy
MDE5LTEwLTMwIDIwOjE3LCBaaGFvLCBZb25nIHdyb3RlOg0KPj4+IHJlbGVhc2VfbWVtIHdvbid0
IGJlIHVzZWQgYXQgYWxsIG9uIEdGWDkgYW5kIEdGWDEwLCBzbyBkZWxldGUgaXQuDQo+PiBIYXdh
aWkgd2FzIEdGWHY3LiBTbyB3ZSdyZSBub3QgdXNpbmcgdGhlIHJlbGVhc2VfbWVtIHBhY2tldCBv
biBHRlh2OA0KPj4gZWl0aGVyLiBXaHkgYXJiaXRyYXJpbHkgbGltaXQgdGhpcyBjaGFuZ2UgdG8g
R0ZYdjkgYW5kIDEwPw0KPj4NCj4+IFJlZ2FyZHMsDQo+PiAgICAgRmVsaXgNCj4+DQo+Pj4gQ2hh
bmdlLUlkOiBJMTM3ODdhOGEyOWI4M2U3NTE2YzU4MmE3NDAxZjJlMTQ3MjFlZGY1Zg0KPj4+IFNp
Z25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4g
ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jIHwgMzUgKyst
LS0tLS0tLS0tLS0tLS0tLQ0KPj4+ICAgIC4uLi9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5l
bF9xdWV1ZV92OS5jICB8IDMzICsrLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjEwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jDQo+Pj4gaW5k
ZXggYWVkMzJhYjcxMDJlLi5iZmQ2MjIxYWNhZTkgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92MTAuYw0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjEwLmMNCj4+PiBAQCAtMjk4
LDM3ICsyOTgsNiBAQCBzdGF0aWMgaW50IHBtX3F1ZXJ5X3N0YXR1c192MTAoc3RydWN0IHBhY2tl
dF9tYW5hZ2VyICpwbSwgdWludDMyX3QgKmJ1ZmZlciwNCj4+PiAgICAgICAgIHJldHVybiAwOw0K
Pj4+ICAgIH0NCj4+Pg0KPj4+IC0NCj4+PiAtc3RhdGljIGludCBwbV9yZWxlYXNlX21lbV92MTAo
dWludDY0X3QgZ3B1X2FkZHIsIHVpbnQzMl90ICpidWZmZXIpDQo+Pj4gLXsNCj4+PiAtICAgICBz
dHJ1Y3QgcG00X21lY19yZWxlYXNlX21lbSAqcGFja2V0Ow0KPj4+IC0NCj4+PiAtICAgICBXQVJO
X09OKCFidWZmZXIpOw0KPj4+IC0NCj4+PiAtICAgICBwYWNrZXQgPSAoc3RydWN0IHBtNF9tZWNf
cmVsZWFzZV9tZW0gKilidWZmZXI7DQo+Pj4gLSAgICAgbWVtc2V0KGJ1ZmZlciwgMCwgc2l6ZW9m
KHN0cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtKSk7DQo+Pj4gLQ0KPj4+IC0gICAgIHBhY2tldC0+
aGVhZGVyLnUzMkFsbCA9IHBtX2J1aWxkX3BtNF9oZWFkZXIoSVRfUkVMRUFTRV9NRU0sDQo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IHBtNF9t
ZWNfcmVsZWFzZV9tZW0pKTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHMyLmV2
ZW50X3R5cGUgPSBDQUNIRV9GTFVTSF9BTkRfSU5WX1RTX0VWRU5UOw0KPj4+IC0gICAgIHBhY2tl
dC0+Yml0ZmllbGRzMi5ldmVudF9pbmRleCA9IGV2ZW50X2luZGV4X19tZWNfcmVsZWFzZV9tZW1f
X2VuZF9vZl9waXBlOw0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi50Y2wxX2FjdGlvbl9l
bmEgPSAxOw0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi50Y19hY3Rpb25fZW5hID0gMTsN
Cj4+PiAtICAgICBwYWNrZXQtPmJpdGZpZWxkczIuY2FjaGVfcG9saWN5ID0gY2FjaGVfcG9saWN5
X19tZWNfcmVsZWFzZV9tZW1fX2xydTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFja2V0LT5iaXRmaWVs
ZHMzLmRhdGFfc2VsID0gZGF0YV9zZWxfX21lY19yZWxlYXNlX21lbV9fc2VuZF8zMl9iaXRfbG93
Ow0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMy5pbnRfc2VsID0NCj4+PiAtICAgICAgICAg
ICAgIGludF9zZWxfX21lY19yZWxlYXNlX21lbV9fc2VuZF9pbnRlcnJ1cHRfYWZ0ZXJfd3JpdGVf
Y29uZmlybTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHM0LmFkZHJlc3NfbG9f
MzJiID0gKGdwdV9hZGRyICYgMHhmZmZmZmZmZikgPj4gMjsNCj4+PiAtICAgICBwYWNrZXQtPmFk
ZHJlc3NfaGkgPSB1cHBlcl8zMl9iaXRzKGdwdV9hZGRyKTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFj
a2V0LT5kYXRhX2xvID0gMDsNCj4+PiAtDQo+Pj4gLSAgICAgcmV0dXJuIHNpemVvZihzdHJ1Y3Qg
cG00X21lY19yZWxlYXNlX21lbSkgLyBzaXplb2YodW5zaWduZWQgaW50KTsNCj4+PiAtfQ0KPj4+
IC0NCj4+PiAgICBjb25zdCBzdHJ1Y3QgcGFja2V0X21hbmFnZXJfZnVuY3Mga2ZkX3YxMF9wbV9m
dW5jcyA9IHsNCj4+PiAgICAgICAgIC5tYXBfcHJvY2VzcyAgICAgICAgICAgICAgICAgICAgPSBw
bV9tYXBfcHJvY2Vzc192MTAsDQo+Pj4gICAgICAgICAucnVubGlzdCAgICAgICAgICAgICAgICAg
ICAgICAgID0gcG1fcnVubGlzdF92MTAsDQo+Pj4gQEAgLTMzNiwxMyArMzA1LDEzIEBAIGNvbnN0
IHN0cnVjdCBwYWNrZXRfbWFuYWdlcl9mdW5jcyBrZmRfdjEwX3BtX2Z1bmNzID0gew0KPj4+ICAg
ICAgICAgLm1hcF9xdWV1ZXMgICAgICAgICAgICAgICAgICAgICA9IHBtX21hcF9xdWV1ZXNfdjEw
LA0KPj4+ICAgICAgICAgLnVubWFwX3F1ZXVlcyAgICAgICAgICAgICAgICAgICA9IHBtX3VubWFw
X3F1ZXVlc192MTAsDQo+Pj4gICAgICAgICAucXVlcnlfc3RhdHVzICAgICAgICAgICAgICAgICAg
ID0gcG1fcXVlcnlfc3RhdHVzX3YxMCwNCj4+PiAtICAgICAucmVsZWFzZV9tZW0gICAgICAgICAg
ICAgICAgICAgID0gcG1fcmVsZWFzZV9tZW1fdjEwLA0KPj4+ICsgICAgIC5yZWxlYXNlX21lbSAg
ICAgICAgICAgICAgICAgICAgPSBOVUxMLA0KPj4+ICAgICAgICAgLm1hcF9wcm9jZXNzX3NpemUg
ICAgICAgICAgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc19tYXBfcHJvY2VzcyksDQo+Pj4g
ICAgICAgICAucnVubGlzdF9zaXplICAgICAgICAgICAgICAgICAgID0gc2l6ZW9mKHN0cnVjdCBw
bTRfbWVzX3J1bmxpc3QpLA0KPj4+ICAgICAgICAgLnNldF9yZXNvdXJjZXNfc2l6ZSAgICAgICAg
ICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc19zZXRfcmVzb3VyY2VzKSwNCj4+PiAgICAgICAg
IC5tYXBfcXVldWVzX3NpemUgICAgICAgICAgICAgICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZXNf
bWFwX3F1ZXVlcyksDQo+Pj4gICAgICAgICAudW5tYXBfcXVldWVzX3NpemUgICAgICAgICAgICAg
ID0gc2l6ZW9mKHN0cnVjdCBwbTRfbWVzX3VubWFwX3F1ZXVlcyksDQo+Pj4gICAgICAgICAucXVl
cnlfc3RhdHVzX3NpemUgICAgICAgICAgICAgID0gc2l6ZW9mKHN0cnVjdCBwbTRfbWVzX3F1ZXJ5
X3N0YXR1cyksDQo+Pj4gLSAgICAgLnJlbGVhc2VfbWVtX3NpemUgICAgICAgICAgICAgICA9IHNp
emVvZihzdHJ1Y3QgcG00X21lY19yZWxlYXNlX21lbSkNCj4+PiArICAgICAucmVsZWFzZV9tZW1f
c2l6ZSAgICAgICAgICAgICAgID0gMCwNCj4+PiAgICB9Ow0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KPj4+IGluZGV4IDNi
NWNhMmIxZDdhNi4uZjBlNDkxMGE4ODY1IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KPj4+IEBAIC0zMzYsMzUgKzMz
Niw2IEBAIHN0YXRpYyBpbnQgcG1fcXVlcnlfc3RhdHVzX3Y5KHN0cnVjdCBwYWNrZXRfbWFuYWdl
ciAqcG0sIHVpbnQzMl90ICpidWZmZXIsDQo+Pj4gICAgICAgICByZXR1cm4gMDsNCj4+PiAgICB9
DQo+Pj4NCj4+PiAtDQo+Pj4gLXN0YXRpYyBpbnQgcG1fcmVsZWFzZV9tZW1fdjkodWludDY0X3Qg
Z3B1X2FkZHIsIHVpbnQzMl90ICpidWZmZXIpDQo+Pj4gLXsNCj4+PiAtICAgICBzdHJ1Y3QgcG00
X21lY19yZWxlYXNlX21lbSAqcGFja2V0Ow0KPj4+IC0NCj4+PiAtICAgICBwYWNrZXQgPSAoc3Ry
dWN0IHBtNF9tZWNfcmVsZWFzZV9tZW0gKilidWZmZXI7DQo+Pj4gLSAgICAgbWVtc2V0KGJ1ZmZl
ciwgMCwgc2l6ZW9mKHN0cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtKSk7DQo+Pj4gLQ0KPj4+IC0g
ICAgIHBhY2tldC0+aGVhZGVyLnUzMkFsbCA9IHBtX2J1aWxkX3BtNF9oZWFkZXIoSVRfUkVMRUFT
RV9NRU0sDQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
c3RydWN0IHBtNF9tZWNfcmVsZWFzZV9tZW0pKTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFja2V0LT5i
aXRmaWVsZHMyLmV2ZW50X3R5cGUgPSBDQUNIRV9GTFVTSF9BTkRfSU5WX1RTX0VWRU5UOw0KPj4+
IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi5ldmVudF9pbmRleCA9IGV2ZW50X2luZGV4X19tZWNf
cmVsZWFzZV9tZW1fX2VuZF9vZl9waXBlOw0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi50
Y2wxX2FjdGlvbl9lbmEgPSAxOw0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi50Y19hY3Rp
b25fZW5hID0gMTsNCj4+PiAtICAgICBwYWNrZXQtPmJpdGZpZWxkczIuY2FjaGVfcG9saWN5ID0g
Y2FjaGVfcG9saWN5X19tZWNfcmVsZWFzZV9tZW1fX2xydTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFj
a2V0LT5iaXRmaWVsZHMzLmRhdGFfc2VsID0gZGF0YV9zZWxfX21lY19yZWxlYXNlX21lbV9fc2Vu
ZF8zMl9iaXRfbG93Ow0KPj4+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMy5pbnRfc2VsID0NCj4+
PiAtICAgICAgICAgICAgIGludF9zZWxfX21lY19yZWxlYXNlX21lbV9fc2VuZF9pbnRlcnJ1cHRf
YWZ0ZXJfd3JpdGVfY29uZmlybTsNCj4+PiAtDQo+Pj4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHM0
LmFkZHJlc3NfbG9fMzJiID0gKGdwdV9hZGRyICYgMHhmZmZmZmZmZikgPj4gMjsNCj4+PiAtICAg
ICBwYWNrZXQtPmFkZHJlc3NfaGkgPSB1cHBlcl8zMl9iaXRzKGdwdV9hZGRyKTsNCj4+PiAtDQo+
Pj4gLSAgICAgcGFja2V0LT5kYXRhX2xvID0gMDsNCj4+PiAtDQo+Pj4gLSAgICAgcmV0dXJuIDA7
DQo+Pj4gLX0NCj4+PiAtDQo+Pj4gICAgY29uc3Qgc3RydWN0IHBhY2tldF9tYW5hZ2VyX2Z1bmNz
IGtmZF92OV9wbV9mdW5jcyA9IHsNCj4+PiAgICAgICAgIC5tYXBfcHJvY2VzcyAgICAgICAgICAg
ID0gcG1fbWFwX3Byb2Nlc3NfdjksDQo+Pj4gICAgICAgICAucnVubGlzdCAgICAgICAgICAgICAg
ICA9IHBtX3J1bmxpc3RfdjksDQo+Pj4gQEAgLTM3MiwxMiArMzQzLDEyIEBAIGNvbnN0IHN0cnVj
dCBwYWNrZXRfbWFuYWdlcl9mdW5jcyBrZmRfdjlfcG1fZnVuY3MgPSB7DQo+Pj4gICAgICAgICAu
bWFwX3F1ZXVlcyAgICAgICAgICAgICA9IHBtX21hcF9xdWV1ZXNfdjksDQo+Pj4gICAgICAgICAu
dW5tYXBfcXVldWVzICAgICAgICAgICA9IHBtX3VubWFwX3F1ZXVlc192OSwNCj4+PiAgICAgICAg
IC5xdWVyeV9zdGF0dXMgICAgICAgICAgID0gcG1fcXVlcnlfc3RhdHVzX3Y5LA0KPj4+IC0gICAg
IC5yZWxlYXNlX21lbSAgICAgICAgICAgID0gcG1fcmVsZWFzZV9tZW1fdjksDQo+Pj4gKyAgICAg
LnJlbGVhc2VfbWVtICAgICAgICAgICAgPSBOVUxMLA0KPj4+ICAgICAgICAgLm1hcF9wcm9jZXNz
X3NpemUgICAgICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZXNfbWFwX3Byb2Nlc3MpLA0KPj4+ICAg
ICAgICAgLnJ1bmxpc3Rfc2l6ZSAgICAgICAgICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZXNfcnVu
bGlzdCksDQo+Pj4gICAgICAgICAuc2V0X3Jlc291cmNlc19zaXplICAgICA9IHNpemVvZihzdHJ1
Y3QgcG00X21lc19zZXRfcmVzb3VyY2VzKSwNCj4+PiAgICAgICAgIC5tYXBfcXVldWVzX3NpemUg
ICAgICAgID0gc2l6ZW9mKHN0cnVjdCBwbTRfbWVzX21hcF9xdWV1ZXMpLA0KPj4+ICAgICAgICAg
LnVubWFwX3F1ZXVlc19zaXplICAgICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZXNfdW5tYXBfcXVl
dWVzKSwNCj4+PiAgICAgICAgIC5xdWVyeV9zdGF0dXNfc2l6ZSAgICAgID0gc2l6ZW9mKHN0cnVj
dCBwbTRfbWVzX3F1ZXJ5X3N0YXR1cyksDQo+Pj4gLSAgICAgLnJlbGVhc2VfbWVtX3NpemUgICAg
ICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZWNfcmVsZWFzZV9tZW0pDQo+Pj4gKyAgICAgLnJlbGVh
c2VfbWVtX3NpemUgICAgICAgPSAwLA0KPj4+ICAgIH07DQo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
