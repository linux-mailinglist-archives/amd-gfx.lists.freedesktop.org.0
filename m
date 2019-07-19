Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00706E176
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5006E58F;
	Fri, 19 Jul 2019 07:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB86E58F
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XymylK+CRvUW2hUl4yhFS67KEyAzxmuFvM6vG/eEc/DYqIwuFrJpXLqZKEMJkZMhOUDqNfITL/6VNmxsw00QNpdrWLCGgccal9nvl0DoQJGrrK00KMuwqgTzhMi0j98ry9ZbBhknHM9SOUwIqcB8ja4f6dmZXpxfSf8OrnR3urgVCzlEpYYlUur31pzW/7EjgEHbL6bqHBDLAWYZVcoKoWtshOGl4ALpH0xygBNBvVy8GlQoqyyXtmnaFenq8nVky+chMYUfcqO7Z2KyPrctrbR8nVIsl1GdSYv7aKrRCvcdsD6bpmLZwnncR+63Db76r7nXAnEGCWTheX8gdN6kQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4SHQmIXdjiu7wrKQ6y7YMqHM1Cxt95Cxx1QHDxnVag=;
 b=bj8PQnA1XZvhUkslM64a9NBvu6+8XHhKJZ5oFHZuPBq+AMvQHPqEr0iLU9M05kJyy9ti7DmlNLXZ2jusPt2AQNMO9mBLbj3R1tsUy2jz1bIWWsD9psAWEK8ka6bPWQISvog7a2fQY16mmRyar1cPFsCIF2WEKKq/CrOdCU6onvLSEhQYG/68V74q8SBhHQgSurazVcQAwKGe7VJkLAkLrTLlkIi1dVvjNxQMUhvTgu3g2t3ZZC3Gz4djgtxGaZhXEqj/uFMLjQ2om8WF4L/pGxM9ikl1/M2AwZwCJ2UWPVJHeyryrmAvoUjhFVoxZWhQRw9iTKQPx/eicIzMqvf9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Fri, 19 Jul 2019 07:11:01 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 07:11:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Topic: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Index: AQHVPMy2BCSk0kBEt0iE3V1wxr2qhabPPYoAgADKfwCAAH9KAIABAUqA
Date: Fri, 19 Jul 2019 07:11:01 +0000
Message-ID: <3c2cf9a5-1c92-e0b4-45cd-324f777d91c0@amd.com>
References: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
 <20190717182233.93031-1-Joseph.Greathouse@amd.com>
 <268d3673-da7f-8e75-6131-3de9291d77d4@amd.com>
 <42627d7f-2431-6b17-72aa-e448b4937c53@gmail.com>
 <CY4PR12MB17679E12D3513F612E48AB55F9C80@CY4PR12MB1767.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB17679E12D3513F612E48AB55F9C80@CY4PR12MB1767.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0187.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::31) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f7dc187-b1e4-4049-e31a-08d70c184197
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1546; 
x-ms-traffictypediagnostic: DM5PR12MB1546:
x-microsoft-antispam-prvs: <DM5PR12MB15463F39FEFE8C80EC023B9983CB0@DM5PR12MB1546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(189003)(199004)(13464003)(36756003)(66476007)(64756008)(66446008)(46003)(66574012)(86362001)(66946007)(476003)(66556008)(2616005)(446003)(11346002)(65806001)(6246003)(65956001)(5660300002)(71190400001)(71200400001)(65826007)(6436002)(186003)(6512007)(478600001)(64126003)(305945005)(7736002)(53936002)(6486002)(68736007)(2906002)(81156014)(31686004)(99286004)(8936002)(6116002)(14444005)(81166006)(256004)(2501003)(486006)(58126008)(102836004)(229853002)(52116002)(53546011)(386003)(76176011)(6506007)(110136005)(25786009)(8676002)(316002)(14454004)(31696002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1546;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7ngz6/Z0KV7J1XEue5iCEY3nLzLycy18KiABdKUl8xlul+EsiL31jatAcs8y5T8HyyNhcs4usDmFrNyIqJlm8orghkAzQfsQx8jQ/tZ4s0ep6pshF8bze1sS4COmLwFRAhszpiY55Zj05HdoOkb7ohgtlkNW67g1duqGR/kWr/Kf8KugOvjU3yk/t75VaJoMBPCU0PtPFemD9bxJBPtTh1BXEdvlJZhkXRjcez+4uX78iLUq7bs9yUKx4wV+lKOUG0gpg1cbiVB+4ux6lgHmXva/rHgpLPrfOyBa0/RQe/uCxoacq5zC46p74O+j/dioWMwZn4nox0TAq3F4WhSswPQiyCiy9ytkNQNVh2boL0tUtlf5Zg4pWl2tYHJZdbUmJFJ5hYpm6PCKk6K2VU8CUf9yZ3ijx6LYWq1Id+zrtUo=
Content-ID: <CA86A3814185E244996B8CA0F351DEE1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7dc187-b1e4-4049-e31a-08d70c184197
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:11:01.7227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4SHQmIXdjiu7wrKQ6y7YMqHM1Cxt95Cxx1QHDxnVag=;
 b=e4v5UbauWwVpzGYQpqFMJg3w2DlReM+qfT/cjUQFhVF2BdNFZVkEQXxchCk30GiTl0ElWS1GjdWJKUa5rxjZhz9rmPSQ/RnVN5rY3zOTcfi742nOmlDf6KJ8X1ra777iug9YgzKE36Ofxi0av5+36iD2tdU6Nj8FemNdTq9eg9M=
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

QW0gMTguMDcuMTkgdW0gMjI6NDYgc2NocmllYiBHcmVhdGhvdXNlLCBKb3NlcGg6DQo+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+PiBTZW50OiBUaHVyc2RheSwgSnVseSAxOCwg
MjAxOSAzOjE0IEFNDQo+PiBUbzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPjsgR3JlYXRob3VzZSwgSm9zZXBoDQo+PiA8Sm9zZXBoLkdyZWF0aG91c2VAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
XSBkcm0vYW1kZ3B1OiBEZWZhdWx0IGRpc2FibGUgR0RTIGZvciBjb21wdXRlDQo+PiBWTUlEcw0K
Pj4NCj4+IEFtIDE3LjA3LjE5IHVtIDIyOjA5IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Og0KPj4+
IE9uIDIwMTktMDctMTcgMTQ6MjMsIEdyZWF0aG91c2UsIEpvc2VwaCB3cm90ZToNCj4+Pj4gVGhl
IEdEUyBhbmQgR1dTIGJsb2NrcyBkZWZhdWx0IHRvIGFsbG93aW5nIGFsbCBWTUlEcyB0bw0KPj4+
PiBhY2Nlc3MgYWxsIGVudHJpZXMuIEdyYXBoaWNzIFZNSURzIGNhbiBoYW5kbGUgc2V0dGluZw0K
Pj4+PiB0aGVzZSBsaW1pdHMgd2hlbiB0aGUgZHJpdmVyIGxhdW5jaGVzIHdvcmsuIEhvd2V2ZXIs
DQo+Pj4+IGNvbXB1dGUgd29ya2xvYWRzIHVuZGVyIEhXUyBjb250cm9sIGRvbid0IGdvIHRocm91
Z2ggdGhlDQo+Pj4+IGtlcm5lbCBkcml2ZXIuIEluc3RlYWQsIEhXUyBmaXJtd2FyZSBzaG91bGQg
c2V0IHRoZXNlDQo+Pj4+IGxpbWl0cyB3aGVuIGEgcHJvY2VzcyBpcyBwdXQgaW50byBhIFZNSUQg
c2xvdC4NCj4+Pj4NCj4+Pj4gRGlzYWJsZSBhY2Nlc3MgdG8gdGhlc2UgZGV2aWNlcyBieSBkZWZh
dWx0IGJ5IHR1cm5pbmcgb2ZmDQo+Pj4+IGFsbCBtYXNrIGJpdHMgKGZvciBPQSkgYW5kIHNldHRp
bmcgQkFTRT1TSVpFPTAgKGZvciBHRFMNCj4+Pj4gYW5kIEdXUykgZm9yIGFsbCBjb21wdXRlIFZN
SURzLiBJZiBhIHByb2Nlc3Mgd2FudHMgdG8gdXNlDQo+Pj4+IHRoZXNlIHJlc291cmNlcywgdGhl
eSBjYW4gcmVxdWVzdCB0aGlzIGZyb20gdGhlIEhXUw0KPj4+PiBmaXJtd2FyZSAod2hlbiBzdWNo
IGNhcGFiaWxpdGllcyBhcmUgZW5hYmxlZCkuIEhXUyB3aWxsDQo+Pj4+IHRoZW4gaGFuZGxlIHNl
dHRpbmcgdGhlIGJhc2UgYW5kIGxpbWl0IGZvciB0aGUgcHJvY2VzcyB3aGVuDQo+Pj4+IGl0IGlz
IGFzc2lnbmVkIHRvIGEgVk1JRC4NCj4+Pj4NCj4+Pj4gVGhpcyB3aWxsIGFsc28gcHJldmVudCB1
c2VyIGtlcm5lbHMgZnJvbSBnZXR0aW5nICdzdHVjaycgaW4NCj4+Pj4gR1dTIGJ5IGFjY2lkZW50
IGlmIHRoZXkgd3JpdGUgR1dTLXVzaW5nIGNvZGUgYnV0IEhXUw0KPj4+PiBmaXJtd2FyZSBpcyBu
b3Qgc2V0IHVwIHRvIGhhbmRsZSBHV1MgcmVzZXQuIFVudGlsIEhXUyBpcw0KPj4+PiBlbmFibGVk
IHRvIGhhbmRsZSBHV1MgcHJvcGVybHksIGFsbCBHV1MgYWNjZXNzZXMgd2lsbA0KPj4+PiBNRU1f
VklPTCBmYXVsdCB0aGUga2VybmVsLg0KPj4+Pg0KPj4+PiB2MjogTW92ZSBpbml0aWFsaXphdGlv
biBvdXRzaWRlIG9mIFNSQk0gbXV0ZXgNCj4+Pj4NCj4+Pj4gQ2hhbmdlLUlkOiBJOGVkY2VhOWQw
YjE0ZDE2YTc0NDRiY2Y5ZmJmOTQ1MWFlZjhiNzA3ZA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb3Nl
cGggR3JlYXRob3VzZSA8Sm9zZXBoLkdyZWF0aG91c2VAYW1kLmNvbT4NCj4+PiBSZXZpZXdlZC1i
eTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+PiBNaWdodCBiZSBh
IGdvb2QgaWRlYSB0byBkbyB0aGlzIGZvciBhbGwgVk1JRHMgZHVyaW5nIGluaXRpYWxpemF0aW9u
IGFuZA0KPj4gbm90IGp1c3QgZm9yIHRoZSBvbmVzIHVzZWQgZm9yIGNvbXB1dGUuDQo+Pg0KPj4g
QnV0IGFueXdheSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZw0KPj4gPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uDQo+IEhtbSwgZ29vZCBwb2ludC4gSXQgbG9va3MgbGlr
ZSBncmFwaGljcyBqb2JzIHdpbGwgZXZlbnR1YWxseSBjYWxsIHRocm91Z2ggdG8gZW1pdF9nZHNf
c3dpdGNoKCkgdG8gc2V0IHRoZXNlIHdoZW4gbGF1bmNoaW5nIGEgam9iLCBidXQgaXQgbWF5IGJl
IHdvcnRod2hpbGUgdG8gc2V0IHRoZXNlIHRvIHplcm8gYXMgYSBkZWZhdWx0LiBJIGRpZG4ndCB3
YW50IHRvIHN0ZXAgb24gYW55IHRvZXMgb24gdGhlIGdyYXBoaWNzIHNpZGUgd2l0aG91dCBjaGVj
a2luZyBmaXJzdC4NCj4NCj4gRG8geW91IGhhdmUgb3BpbmlvbnMgb24gdGhlIG1vc3QgcmVhc29u
YWJsZSBsb2NhdGlvbiB0byBkbyB0aGlzPyBlYXJseV9pbml0KCksIGxhdGVfaW5pdCgpPyBUaGUg
dmFyaW91cyBnZnhfdipfc2V0X2dkc19pbml0KCkgbWlnaHQgYmUgYSBnb29kIHBsYWNlIC0tIGEg
cXVpY2sgdGVzdCBvZiBzZXR0aW5nIGFsbCAxNiBWTUlEcyBpbiBnZnhfdjlfMF9zZXRfZ2RzX2lu
aXQoKSBhcHBlYXJzIHRvIHdvcmsgZmluZSBvbiBteSBWZWdhIDIwLg0KDQpXaXRoIHRoZSBleGNl
cHRpb24gb2YgdGhlIEdNQyBhbGwgaHcgaW5pdGlhbGl6YXRpb24gc2hvdWxkIGJlIGluIA0KaHdf
aW5pdC4gU28gc2V0X2dkc19pbml0IG1pZ2h0IHdvcmssIGJ1dCBpcyBjZXJ0YWlubHkgdGhlIHdy
b25nIHBsYWNlLg0KDQpJIHdvdWxkbid0IG1pbmQgcmVuYW1pbmcgZ2Z4XypfaW5pdF9jb21wdXRl
X3ZtaWQoKSBpbnRvIA0KZ2Z4XypfaW5pdF92bWlkKCkgYW5kIHNldHRpbmcgcmVhc29uYWJsZSBk
ZWZhdWx0cyBmb3IgYm90aCBjb21wdXRlIGFzIA0Kd2VsbCBhcyBnZnggVk1JRHMuDQoNCkNocmlz
dGlhbi4NCg0KPg0KPiAtSm9lDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
