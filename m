Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2433C81DA
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Jul 2021 11:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B796E1EE;
	Wed, 14 Jul 2021 09:41:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A10E6E1EE
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 09:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaOZMoecEyTcafPJJNPR7hQJLokq2qCHRTPBH1mxo74d2kssiaXRlri9rXKCXJ8heFKjxT0QQElFywPi85VnU0Xp6Xkk93sESOTTvuGqvC6HCUx052sU+9Tf6vgJApRlgM3hfYpOiPnDGasqCpy/g6vEKqTCQdG3eWlLEVVv8xiFLbP49LWMnKY4I91ClyXEa/PEH4muF1jkOlD4RyWr5PukqsSvAHQJjfJuunA7XqvvwYMVazJCqKlTUdeAd7teINnqw/oMJh6fM3cA0I6wej2ZUrEUu+Wh0wIdJL5ctUT/gL2XYb+ZiwkGPe+k/iVyPri2Mrqs9eWjDdkTSyOJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjF7mfjuk+An6neiKKZQCY9BUHMpUedU4KKMtKj6IB8=;
 b=VVnpBK8ThsUH+L7mumz5Pr/K8745c/qvdBMv5TUd0lvX2DRyVMLR5JRgDk+CxIAJ5kBs1vZv/reiEWvQtn4SMA9oG4sN1TNqO0mYOP6RhGcA6LysNlRQ/BI9hGjX0oC+mMc6nnW72uL0fYfrt0Sj70T0/AJPcD4BaXz8HWnJPcV8Y/Dmta3Hk2RhFp3RkRuv/e+d/DxBOKK/Xk7eS8rVs0mF3SsrHGmNEqVpBKISFMsgJj0eETuJ374IUtTMl5wfMSgVm6pkCCoVw6DQZwsal8MTgOian2U1zSXfCjT2xIFy6UtsC28m7OhG9lc2vmNG+8q2xzqWi4htRnuoCxlwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjF7mfjuk+An6neiKKZQCY9BUHMpUedU4KKMtKj6IB8=;
 b=qOhORY/64vKVOjccmWqBLbywFxOtj/p0Fm6I2q4y56OF6pIWseo4jAsVPOJOEId0x8EWTPr1mswyKwloe0EybYYOZOHGGThmYnC00K6KhJZvonANoWQfLB2Nf5IuQgLVkDJ+g+qS+qKir9rnoc/Tcdna8ukKlOXgDUNiVptwdbA=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5117.namprd12.prod.outlook.com (2603:10b6:5:390::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Wed, 14 Jul 2021 09:41:36 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3512:a4ee:5aad:655f]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3512:a4ee:5aad:655f%8]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 09:41:36 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: further lower VRAM allocation overhead
Thread-Topic: [PATCH] drm/amdgpu: further lower VRAM allocation overhead
Thread-Index: AQHXeBvPOkUIWmC1J0Ws+RcOJPlLmatBR+CAgADdzwCAABL2AA==
Date: Wed, 14 Jul 2021 09:41:36 +0000
Message-ID: <85338D1E-7547-44FE-9DEB-FF621C3F8A1D@amd.com>
References: <20210713191739.458131-1-jinhuieric.huang@amd.com>
 <a1cad35e-e24d-3078-bbc2-1534a625d932@amd.com>
 <7ac4af39-5dd9-1eac-3208-dcfecb422269@gmail.com>
In-Reply-To: <7ac4af39-5dd9-1eac-3208-dcfecb422269@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce3fb697-1504-4ed1-19ee-08d946ab929f
x-ms-traffictypediagnostic: DM4PR12MB5117:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB51176874D67728C2EE939CC987139@DM4PR12MB5117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0+QS0evDv83uvszVf0v5Z+w0teXe7nvcPdk1nYvnRtQMd2wqKMfiXzrBcos4HTEZrplnkJWm8uytDrNgS95J9Xcp9hT1K7qaLbVCkNC1EE79vma4++W7jUTctCYbOZKdHpyDBAN5lBQEtU4+26ml/r3CkQlY2BgdXJhLbF9tjxSqMvSdoXwD5j/zxnK0OF+vVqOhvdu0XpPLmGWqF+Ih6LfGFguw89z7TGqgbtV8E99/lGoQOoR7WPupF/jxsV179npwTKMyE6nqk1Ja83LDPC5JHetATJ6e8ArQSF9M/mJzolOmlfWvQGXCuCLwX3OSd5fLH+pYCA+QwoHywUJ5JuQPgy7HQVnbVhLy4KU3+DeLoLFUwsn2eV60kbLKZAT/Vjgbpw9GgS08JTOuTsB6JqCVWMRwNLlFEWQl9/c4l3QD7V3GCpUw05ALwiT9CnP7wqgJR1CgRz5EPFuhT5KX0jM3kvWbH+Md1SbNc9/zD+9PPo7KG0/s/dq8CR3CzURmJAFDNWqf1l/caRZmR2fd4wJH3O40o+YCcdvszDjcFlw3A0IwVBYJhev6NxoAAjhjRAmrE4CPrR9rF10qegHHnlraMIBzKbLgekwpFJGMfOZ8GxcnCqaAdT1sZ0YC1fT1TSaMdoHAtq4pKEitpmn70X9VgQ065gVaCwqt3N1TXDqNOruskMuv8cQr0WZnCSZ/s+22aQVGTBSLRqFFIbK8BBTXyOgUre7rQvqkCCC9coo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(8676002)(45080400002)(122000001)(6512007)(66574015)(478600001)(83380400001)(8936002)(966005)(66446008)(66556008)(64756008)(316002)(66476007)(36756003)(76116006)(2906002)(86362001)(38100700002)(91956017)(66946007)(26005)(4326008)(2616005)(5660300002)(54906003)(33656002)(53546011)(6506007)(6916009)(71200400001)(6486002)(186003)(38070700004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akl5NVA5MVNPaEpjM2xZYkhEWlE2aE5vd2xsSHJEbkF2S2FLNWZ2b2NWUjlv?=
 =?utf-8?B?WjVtbUZZb2JVTjB4Sm9SUVg3SXhWSlQ1SThQQjlHejlsNk43MlN2WFBpR0Y5?=
 =?utf-8?B?U0JPT2VNMkhCMGFBdElyd0hPVjBTR1lzU3BYRFhJcStxczNEM3NWMnYxaDJJ?=
 =?utf-8?B?ZnMxdVExckY1QUk4ejFiQUZKYmtscWN4OEYwcGtUS0NPNXVOTUduY3lHNTU4?=
 =?utf-8?B?V3ZTdnZzY1lWTVZPVTJPeWE5dXVzNnVrNkFPM3I4OU5jVE1OKzdFSzRkNDlo?=
 =?utf-8?B?NnBRM3ZPK2xMYmh3UzN2Q1VDZVQ4d1F3WmdYcTVwZFBYRVVma3ZMVEhSOHdu?=
 =?utf-8?B?eCs2MzhEV3JhaEsvclV2NFczSWh3a24raGIxdW1JYlVWenZORGFqQWpESHdw?=
 =?utf-8?B?SnFwY0cxRjNjZ0R3TTdwaFphV2JGM0E3TXNtRytrSngvSUVZVDBTd3h5Z2px?=
 =?utf-8?B?Slk0dWQ2MVJKbE9kUnRDZm1SMktVak9jZWZqc2EvU3l3NWJDaHBUVUFlUDh2?=
 =?utf-8?B?d2NhQWc2RGFLZ1dFQnJpcEtGTk44cUJoaGZId1cxRkRkcGhTU1JDY2xSaDEv?=
 =?utf-8?B?SWlYU3BCcHkvMVpKclFHVkloaXorOEdFNmZCdHFNa1FtSGw5OE9xTW53UHVx?=
 =?utf-8?B?SUNSOG5LREd5VlVlZnRRSkZRWGplSEVnQUlpL1RNT1YzR0k0NWFWaTZ6VUp4?=
 =?utf-8?B?SE9WTXI0S0JveWVFWmRrOVo4dDBETUhnY1hqbE5sNWdTcFpZR0M1SlVvKzlh?=
 =?utf-8?B?VHN3YTA2a3NndGFyWFo3ckQ4NU55cHBlK3BpL0p6RDYrbU02OFVDRnU0OHRB?=
 =?utf-8?B?NnAxVlgweCtVNXFxV24zV1NuQmVaYnBtd2trUldKMFN0UHdBbGZwaUV4QVNI?=
 =?utf-8?B?cXA2Yjl5SVBoOVFyMTBRV3Vxb1l4dVhEbE5lb2NxUUtSV2lhM00zSmtkaU9P?=
 =?utf-8?B?UFd6bEtlQ056ZDduSzBGc3U5RHc0bDVnU2ZEemJVTlJxNCtWNTF5WWRBYVdG?=
 =?utf-8?B?T29rQnlNK0NLcnJjUmVQSlpJM0dVZXR1eldSam5WbzN2bUgvb1BvS3NOY3lO?=
 =?utf-8?B?TE1CRlRWQXJ6a2VOcHBBdDlSajM3L3ZWREF6cWZJMFlUbjdRYzhKZE5abEVq?=
 =?utf-8?B?cmtDdnpUdlJWU0ZMRnpsYUk4aFJybUR2Q0Zad0ZMN3cvRVhudkE2VEUzOEtV?=
 =?utf-8?B?WERmdkRMUThMd3Z2ZFduMUpnVEp4RzE2OVh4ZDlEdXZMeUVHdlJmOGtoeWcr?=
 =?utf-8?B?YzZpdFQyZk50cHlnMTZHd3hWcVVidk9WNVFpVnRremVJTi96M3ZjS1FKeEtQ?=
 =?utf-8?B?VmJONUZyQzVkQ3VrN1krQkE3ZmZMYWJKZTduc2Y5bCtHR3JoMkluZ1NCMlJi?=
 =?utf-8?B?VWhBSE1COUhPZjBhVHdqQkF2dXo4SzN3YW9kcXJmOGJrMVZnZzJDQ1ZyeU5V?=
 =?utf-8?B?R0hpb29KajlicnZFN1owTklGNllhQkRpNVppUzhMZU5RRkVEV2c0ZFpLOWJ1?=
 =?utf-8?B?dzI4MnN0aG5OWVUzeFdmZ0g5ZEpqUlludElYdzVBalBUc2k2Tk1jZmVZQzJU?=
 =?utf-8?B?N2ZFYWZ3ejRMUHJqZXJmVWVxRW1UbWlsdEZlRlQ3SG5ya2tveXZ3NE81OHp5?=
 =?utf-8?B?QjVlRGtMRjdPZFJsQU9BWVROWjhWSUZPalM4SXNoRHNJSzlSNmNSdDM3aGxn?=
 =?utf-8?B?Z3JOTWFZSm1SbE1kbzdxOS9sNllXTEMvRXlodVVzTDB3NHV3UUd6NDdDNFZO?=
 =?utf-8?Q?OLETSTVJ7VuTtY0ByVvOm2/3a1FIgmjOmWdghZs?=
Content-ID: <73AA509AA1300940B60645E5AA8A9076@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3fb697-1504-4ed1-19ee-08d946ab929f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 09:41:36.1225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMLFQK3gdDfRyt07/h74KiS7thFIcmeesrwZYaoYs75n1pQU3zKOUo2ksrMPKyr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5117
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gMjAyMeW5tDfmnIgxNOaXpSAxNjozM++8jENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiDlhpnpgZPvvJoNCj4gDQo+IEhpIEVyaWMsDQo+IA0K
PiBmZWVsIGZyZWUgdG8gcHVzaCBpbnRvIGFtZC1zdGFnaW5nLWRrbXMtNS4xMSwgYnV0IHBsZWFz
ZSBkb24ndCBwdXNoIGl0IGludG8gYW1kLXN0YWdpbmctZHJtLW5leHQuDQo+IA0KPiBUaGUgbGF0
ZXIgd2lsbCBqdXN0IGNhdXNlIGEgbWVyZ2UgZmFpbHVyZSB3aGljaCBBbGV4IG5lZWRzIHRvIHJl
c29sdmUgbWFudWFsbHkuDQo+IA0KPiBJIGNhbiB0YWtlIGNhcmUgb2YgcHVzaGluZyB0byBhbWQt
c3RhZ2luZy1kcm0tbmV4dCBhcyBzb29uIGFzIHRoYXQgaXMgcmViYXNlZCBvbiBsYXRlc3QgdXBz
dHJlYW0uDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPiBBbSAxMy4wNy4yMSB1
bSAyMToxOSBzY2hyaWViIEVyaWMgSHVhbmc6DQo+PiBIaSBDaHJpc3RpYW4vRmVsaXgsDQo+PiAN
Cj4+IElmIHlvdSBkb24ndCBoYXZlIG9iamVjdGlvbiwgaXQgd2lsbCBiZSBwdXNoZWQgaW50byBh
bWQtc3RhZ2luZy1ka21zLTUuMTEgYW5kIGFtZC1zdGFnaW5nLWRybS1uZXh0Lg0KPj4gDQo+PiBU
aGFua3MsDQo+PiBFcmljDQo+PiANCj4+IE9uIDIwMjEtMDctMTMgMzoxNyBwLm0uLCBFcmljIEh1
YW5nIHdyb3RlOg0KPj4+IEZvciBhbGxvY2F0aW9ucyBsYXJnZXIgdGhhbiA0OE1pQiB3ZSBuZWVk
IG1vcmUgdGhhbiBhIHBhZ2UgZm9yIHRoZQ0KPj4+IGhvdXNla2VlcGluZyBpbiB0aGUgd29yc3Qg
Y2FzZSByZXN1bHRpbmcgaW4gdGhlIHVzdWFsIHZtYWxsb2Mgb3ZlcmhlYWQuDQo+Pj4gDQo+Pj4g
VHJ5IHRvIGF2b2lkIHRoaXMgYnkgYXNzdW1pbmcgdGhlIGdvb2QgY2FzZSBhbmQgb25seSBmYWxs
aW5nIGJhY2sgdG8gdGhlDQo+Pj4gd29yc3QgY2FzZSBpZiB0aGlzIGRpZG4ndCB3b3JrZWQuDQo+
Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEVyaWMgSHVhbmcgPGppbmh1aWVyaWMuaHVh
bmdAYW1kLmNvbT4NCj4+PiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdnJhbV9tZ3IuYyB8IDcxICsrKysrKysrKysrKysrKy0tLS0tDQo+Pj4gICAxIGZpbGUg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4+PiBpbmRleCBi
ZTQyNjFjNDUxMmUuLmVjYmUwNWUxZGI2NiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+Pj4gQEAgLTM2MSw5ICszNjEsMTEgQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX3ZpcnRfc3RhcnQoc3RydWN0IHR0bV9yZXNvdXJj
ZSAqbWVtLA0KPj4+ICAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1f
cmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdGJvLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB0dG1fcGxhY2UgKnBsYWNlLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBudW1fbm9kZXMsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBh
Z2VzX3Blcl9ub2RlLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fcmVzb3Vy
Y2UgKm1lbSkNCj4+PiAgIHsNCj4+PiAtICAgIHVuc2lnbmVkIGxvbmcgbHBmbiwgbnVtX25vZGVz
LCBwYWdlc19wZXJfbm9kZSwgcGFnZXNfbGVmdCwgcGFnZXM7DQo+Pj4gKyAgICB1bnNpZ25lZCBs
b25nIGxwZm4sIHBhZ2VzX2xlZnQsIHBhZ2VzOw0KPj4+ICAgICAgIHN0cnVjdCBhbWRncHVfdnJh
bV9tZ3IgKm1nciA9IHRvX3ZyYW1fbWdyKG1hbik7DQo+Pj4gICAgICAgc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKG1ncik7DQo+Pj4gICAgICAgdWludDY0X3Qg
dmlzX3VzYWdlID0gMCwgbWVtX2J5dGVzLCBtYXhfYnl0ZXM7DQo+Pj4gQEAgLTM5MywyMSArMzk1
LDYgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fcmVzb3VyY2Vf
bWFuYWdlciAqbWFuLA0KPj4+ICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsNCj4+PiAgICAgICB9
DQo+Pj4gICAtICAgIGlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTKSB7
DQo+Pj4gLSAgICAgICAgcGFnZXNfcGVyX25vZGUgPSB+MHVsOw0KPj4+IC0gICAgICAgIG51bV9u
b2RlcyA9IDE7DQo+Pj4gLSAgICB9IGVsc2Ugew0KPj4+IC0jaWZkZWYgQ09ORklHX1RSQU5TUEFS
RU5UX0hVR0VQQUdFDQo+Pj4gLSAgICAgICAgcGFnZXNfcGVyX25vZGUgPSBIUEFHRV9QTURfTlI7
DQo+Pj4gLSNlbHNlDQo+Pj4gLSAgICAgICAgLyogZGVmYXVsdCB0byAyTUIgKi8NCj4+PiAtICAg
ICAgICBwYWdlc19wZXJfbm9kZSA9IDJVTCA8PCAoMjBVTCAtIFBBR0VfU0hJRlQpOw0KPj4+IC0j
ZW5kaWYNCj4+PiAtICAgICAgICBwYWdlc19wZXJfbm9kZSA9IG1heF90KHVpbnQzMl90LCBwYWdl
c19wZXJfbm9kZSwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBtZW0tPnBhZ2VfYWxpZ25t
ZW50KTsNCj4+PiAtICAgICAgICBudW1fbm9kZXMgPSBESVZfUk9VTkRfVVAobWVtLT5udW1fcGFn
ZXMsIHBhZ2VzX3Blcl9ub2RlKTsNCj4+PiAtICAgIH0NCj4+PiAtDQo+Pj4gICAgICAgbm9kZXMg
PSBrdm1hbGxvY19hcnJheSgodWludDMyX3QpbnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwNCj4+
PiAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7DQo+Pj4gICAg
ICAgaWYgKCFub2Rlcykgew0KPj4+IEBAIC00MzUsNyArNDIyLDEyIEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4+PiAg
ICAgICBpID0gMDsNCj4+PiAgICAgICBzcGluX2xvY2soJm1nci0+bG9jayk7DQo+Pj4gICAgICAg
d2hpbGUgKHBhZ2VzX2xlZnQpIHsNCj4+PiAtICAgICAgICB1aW50MzJfdCBhbGlnbm1lbnQgPSBt
ZW0tPnBhZ2VfYWxpZ25tZW50Ow0KPj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ25tZW50
ID0gbWVtLT5wYWdlX2FsaWdubWVudDsNCj4+PiArDQo+Pj4gKyAgICAgICAgaWYgKGkgPj0gbnVt
X25vZGVzKSB7DQo+Pj4gKyAgICAgICAgICAgIHIgPSAtRTJCSUc7DQo+Pj4gKyAgICAgICAgICAg
IGdvdG8gZXJyb3I7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICAgICAgICAgICAgIGlmIChwYWdlcyA+
PSBwYWdlc19wZXJfbm9kZSkNCj4+PiAgICAgICAgICAgICAgIGFsaWdubWVudCA9IHBhZ2VzX3Bl
cl9ub2RlOw0KPj4+IEBAIC00OTIsNiArNDg0LDQ5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1f
bWdyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4+PiAgICAgICByZXR1
cm4gcjsNCj4+PiAgIH0NCj4+PiAgICsvKioNCj4+PiArICogYW1kZ3B1X3ZyYW1fbWdyX2FsbG9j
IC0gYWxsb2NhdGUgbmV3IHJhbmdlDQo+Pj4gKyAqDQo+Pj4gKyAqIEBtYW46IFRUTSBtZW1vcnkg
dHlwZSBtYW5hZ2VyDQo+Pj4gKyAqIEB0Ym86IFRUTSBCTyB3ZSBuZWVkIHRoaXMgcmFuZ2UgZm9y
DQo+Pj4gKyAqIEBwbGFjZTogcGxhY2VtZW50IGZsYWdzIGFuZCByZXN0cmljdGlvbnMNCj4+PiAr
ICogQG1lbTogdGhlIHJlc3VsdGluZyBtZW0gb2JqZWN0DQo+Pj4gKyAqDQo+Pj4gKyAqIEFsbG9j
YXRlIFZSQU0gZm9yIHRoZSBnaXZlbiBCTy4NCj4+PiArICovDQo+Pj4gK3N0YXRpYyBpbnQgYW1k
Z3B1X3ZyYW1fbWdyX2FsbG9jKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KPj4+
ICsgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvLA0KPj4+ICsg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLA0KPj4+ICsgICAg
ICAgICAgICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkNCj4+PiArew0KPj4+ICsgICAg
dW5zaWduZWQgbG9uZyBudW1fbm9kZXMsIHBhZ2VzX3Blcl9ub2RlOw0KPj4+ICsgICAgaW50IHI7
DQo+Pj4gKw0KPj4+ICsgICAgaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX0NPTlRJR1VP
VVMpDQo+Pj4gKyAgICAgICAgcmV0dXJuIGFtZGdwdV92cmFtX21ncl9uZXcobWFuLCB0Ym8sIHBs
YWNlLCAxLCB+MHVsLCBtZW0pOw0KPj4+ICsNCj4+PiArI2lmZGVmIENPTkZJR19UUkFOU1BBUkVO
VF9IVUdFUEFHRQ0KPj4+ICsgICAgcGFnZXNfcGVyX25vZGUgPSBIUEFHRV9QTURfTlI7DQo+Pj4g
KyNlbHNlDQo+Pj4gKyAgICAvKiBkZWZhdWx0IHRvIDJNQiAqLw0KPj4+ICsgICAgcGFnZXNfcGVy
X25vZGUgPSAyVUwgPDwgKDIwVUwgLSBQQUdFX1NISUZUKTsNCj4+PiArI2VuZGlmDQo+Pj4gKyAg
ICBwYWdlc19wZXJfbm9kZSA9IG1heF90KHVpbnQzMl90LCBwYWdlc19wZXJfbm9kZSwNCj4+PiAr
ICAgICAgICAgICAgICAgICAgIG1lbS0+cGFnZV9hbGlnbm1lbnQpOw0KPj4+ICsgICAgbnVtX25v
ZGVzID0gRElWX1JPVU5EX1VQKG1lbS0+bnVtX3BhZ2VzLCBwYWdlc19wZXJfbm9kZSk7DQo+Pj4g
Kw0KPj4+ICsgICAgaWYgKHNpemVvZihzdHJ1Y3QgZHJtX21tX25vZGUpICogbnVtX25vZGVzID4g
UEFHRV9TSVpFKSB7DQoNCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgPCBQQUdFX1NJWkU/IE90aGVy
d2lzZSBhbWRncHVfdnJhbV9tZ3JfbmV3IGFsd2F5cyByZXR1cm4gLUUyQklHLiAgT3IgSSBhbSBt
aXNzaW5nIHNvbWV0aGluZz8NCg0KQnV0IHlvdSB3YW50IG9uZSBwYWdlIHRvIHNhdmUgYWxsIGRy
bSBtbSBub2RlcyBpbiB0aGUgZ29vZCBjYXNlLiBXaGF0IGlmIHVzZXIganVzdCBjcmVhdGUgYSBi
dW5jaCBvZiBzbWFsbCBWUkFNIEJPLCBzYXksIDEgdGhvdW5kIG9mIDRLQiBWUkFNIEJPcy4NCnRo
ZSBzeXN0ZW0gbWVtb3J5IHVzYWdlIHdvdWxkIGNoYW5nZSBmcm9tIDI0S0IgdG8gNE1CLiBJIGhh
dmUgbm8gc3Ryb25nIG9iamVjdGlvbiB0byBpdCBhcyB0aW1lIGlzIG1vcmUgZXhwZW5zaXZlIGlu
IHJlYWxpdHkuDQoNCg0KDQo+Pj4gKyAgICAgICAgciA9IGFtZGdwdV92cmFtX21ncl9uZXcobWFu
LCB0Ym8sIHBsYWNlLA0KPj4+ICsgICAgICAgICAgICAgICAgUEFHRV9TSVpFIC8gc2l6ZW9mKHN0
cnVjdCBkcm1fbW1fbm9kZSksDQo+Pj4gKyAgICAgICAgICAgICAgICBwYWdlc19wZXJfbm9kZSwg
ICAgbWVtKTsNCj4+PiArICAgICAgICBpZiAociAhPSAtRTJCSUcpDQo+Pj4gKyAgICAgICAgICAg
IHJldHVybiByOw0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIHJldHVybiBhbWRncHVfdnJh
bV9tZ3JfbmV3KG1hbiwgdGJvLCBwbGFjZSwgbnVtX25vZGVzLCBwYWdlc19wZXJfbm9kZSwNCj4+
PiArICAgICAgICAgICAgICAgICAgIG1lbSk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAvKioNCj4+
PiAgICAqIGFtZGdwdV92cmFtX21ncl9kZWwgLSBmcmVlIHJhbmdlcw0KPj4+ICAgICoNCj4+PiBA
QCAtNjkzLDcgKzcyOCw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92cmFtX21ncl9kZWJ1ZyhzdHJ1
Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4+PiAgIH0NCj4+PiAgICAgc3RhdGljIGNv
bnN0IHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9mdW5jIGFtZGdwdV92cmFtX21ncl9mdW5j
ID0gew0KPj4+IC0gICAgLmFsbG9jICAgID0gYW1kZ3B1X3ZyYW1fbWdyX25ldywNCj4+PiArICAg
IC5hbGxvYyAgICA9IGFtZGdwdV92cmFtX21ncl9hbGxvYywNCj4+PiAgICAgICAuZnJlZSAgICA9
IGFtZGdwdV92cmFtX21ncl9kZWwsDQo+Pj4gICAgICAgLmRlYnVnICAgID0gYW1kZ3B1X3ZyYW1f
bWdyX2RlYnVnDQo+Pj4gICB9Ow0KPj4gDQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmcl
MkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0N4aW5odWku
cGFuJTQwYW1kLmNvbSU3QzY2NDY1Y2MyZDZiOTQ2OGEyZDgyMDhkOTQ2YTIxOGJhJTdDM2RkODk2
MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzYxODQ4NDI4OTMzNjkzNyU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16
SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1VMXhmREVL
ZEttRHIlMkZlRkYlMkJYb0xhWlZjdVR6Y29Gbm9aT0QlMkZ3bzRyZWRvJTNEJmFtcDtyZXNlcnZl
ZD0wDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8l
MkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0N4aW5odWkucGFuJTQwYW1kLmNvbSU3QzY2NDY1
Y2MyZDZiOTQ2OGEyZDgyMDhkOTQ2YTIxOGJhJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0
ZTE4M2QlN0MwJTdDMCU3QzYzNzYxODQ4NDI4OTMzNjkzNyU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1VMXhmREVLZEttRHIlMkZlRkYlMkJYb0xhWlZj
dVR6Y29Gbm9aT0QlMkZ3bzRyZWRvJTNEJmFtcDtyZXNlcnZlZD0wDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
