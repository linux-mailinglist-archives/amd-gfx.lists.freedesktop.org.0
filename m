Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173B343605
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Mar 2021 01:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8751589F63;
	Mon, 22 Mar 2021 00:47:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4389F63
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 00:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEvhOBf3X1H0POF1KpbODgvUQP3qWmyUi54KfLSObF13UX9Mvv0ICO6FX2nK7C06z+3ck9zg5jZ37oYVhueUs6BizaaTFqaRhe7orvPjyLyeP4oabau/Y1j6DAZ0kNstIE5lOMxsTfE5iYysGDQtUQsbMMy1ed2vpMsMxfVH/HS+kkT0/mN6/Tolq2ykYzkWz1r8lsg/+2yNTyBneYSzUNjKWYR8fbDASKCCQC0pTAK7ynLxpC8QNDwOiNLaus+NRrV75g03TCEG0xbl90vSXcXgZGzJcCMP9FtYk8QwIZf8T6ek1w375BWkfytMIYn8MXVqgdY7GJLb5jVoPV9p/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z899Ikn0n0QU/BmFC7xkWDkis9csTRDzAJf6jb2SCbs=;
 b=eU/bGgQLNFBHCSLOMwwDN8E4QenvqfzXFNvuYPd90kuKJW7ZlL2+ZIev5kVhaXMLsaZgSz8ksK9JZI4HPR8govcgP/ERjMhi/c0l2RITCJu29N8QfPSxgEwKJ7gHl9Pbom9ESp0v9lBZulngSvdTKc9Qj3uYPHlfPvHryuOCDCyUyGm4pz6hEZHdBh/QnlVQb8Yc6bpYiVps1xrAk+bXoyzBf4yzHd3D4RByq5J/AK15uwV/GLnHPWQ8+36fZoXq8URUDRs4EftUde6NXtEJuamnHtN+e9u+YLWF3GYUnKQimnEZ5VsXfPa26aP5ZX9odiBG57i1sY1eucRhvf+aKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z899Ikn0n0QU/BmFC7xkWDkis9csTRDzAJf6jb2SCbs=;
 b=rxDTPNjjslvLa2s3xWKXaGEOKinUrNvfQbs7ZB1dCl+soAUroztXOSxDD7h7abkyr9zdUVHtDN3CsA/Tt85DPpwnq5VTMJPyb/u5HbJGuMoMiAwf5Uu5RG6CdHIpLzCpYaB+2NbHU8NHAJYMrVWJ9Q7zs1z57lpuCy7BK3VPKxY=
Received: from DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23)
 by DM6PR12MB2730.namprd12.prod.outlook.com (2603:10b6:5:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 00:47:54 +0000
Received: from DM5PR1201MB0057.namprd12.prod.outlook.com
 ([fe80::99bd:b7c0:520d:92dd]) by DM5PR1201MB0057.namprd12.prod.outlook.com
 ([fe80::99bd:b7c0:520d:92dd%11]) with mapi id 15.20.3955.025; Mon, 22 Mar
 2021 00:47:54 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/8] drm/amdgpu: use the new cursor in
 amdgpu_ttm_access_memory
Thread-Topic: [PATCH 5/8] drm/amdgpu: use the new cursor in
 amdgpu_ttm_access_memory
Thread-Index: AQHXFCCrxIuugHhH20aHizrsH0TFKKqL4+GAgADE7wCAApZZ0A==
Date: Mon, 22 Mar 2021 00:47:53 +0000
Message-ID: <DM5PR1201MB0057C42BA99E95E3990911A087659@DM5PR1201MB0057.namprd12.prod.outlook.com>
References: <20210308134044.133658-1-christian.koenig@amd.com>
 <20210308134044.133658-5-christian.koenig@amd.com>
 <8c5e8ae9-8069-bfd6-9a3a-2abe2cdee6ae@amd.com>
 <a8ab6ad5-b02a-d539-3c89-a0065b91fca5@gmail.com>
In-Reply-To: <a8ab6ad5-b02a-d539-3c89-a0065b91fca5@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f3a78f1f-69a3-4af6-85ea-a7c88342ca66;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-22T00:38:42Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0acb994f-b060-4a3c-ee77-08d8eccc20df
x-ms-traffictypediagnostic: DM6PR12MB2730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2730479758A2154EFE89457387659@DM6PR12MB2730.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vrei9pOk0RZP6wycStfN4DU9BTc2hwnqDbkuKUH+dxX8wJPGxgsr9Eu0QAuo5b5ii5FLzRvAOhxtXVPcwbgUbp0X+KtbAzTneT+1FEBmlEjAe7kNxdsQ3MoVgGyo6DNJPm7l1+4XD9MZfURI3HT9i95TFWnSXUbT+QrLxK5JYWSicGsuPWbUmFr27Et2nJVhZakLx+ZtL+dkC4/MfO1x9tgCk8ze4NW5Fi+7n4N41+HlsbPoQQhQzVfQzV0dUvA3LAEdx8dOwHbQJoTEM6m0Tp1K7uuGGWQOqjFUexT6O9+wYFOE2agmF++vA/aid+RET3klCBptZVrUD+Rlk1VDy26qt4h0eOSQER/Ma8xv6lS5ICH+nbuDlGo6jNPoY3fwpsdvyibMbpvBb5GAbeGDlQQuJHWxqRF9mcK4hgLnQQW2cFOkO0CjXL+aBJDQ7WPjuZ5bGx+R3AIEl20PBUc/5BNezmOF+zPAZMCsOOuOEHpvm/OCYBTPoIzl1vKrNUfBkGorxaS7bFZMr5x89HncsrOqBIyncQqUbyq3Ur6zBA4csiMhw0oY1y1gWe/w5/POOpjr4WK4QPFdyRYyPRYpaev/ciXfkmi7Fw7zblYdC7B8HVBq/B5xWk/9Qn6Rad61Xtl6n8i4hP3UWCknFt0SpxoZ0WrfnQEnfTdQiFSi7Rw9aMG7qtbCz2jJN8+CTM+l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0057.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(83380400001)(38100700001)(86362001)(26005)(66574015)(2906002)(9686003)(55016002)(7696005)(8936002)(5660300002)(316002)(52536014)(110136005)(76116006)(478600001)(8676002)(45080400002)(966005)(186003)(66946007)(71200400001)(6506007)(33656002)(66476007)(66556008)(53546011)(64756008)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SFRoUS8rOEhORWU5MnMyeC9rb1k4cWRTcUdTaGtOWDFHUVNpMjdQZjJmZGlm?=
 =?utf-8?B?Skh4dVl0VXJHSll2dVR3cm1vQVRXQU9aOVBOb1FJbnFQQWlDMjhoeUlSOUNp?=
 =?utf-8?B?MWFqaHI2VVdqbzlVMCtPaHdPUTlyYXJEbmY5MnRQYU0wUmJmcVBHYW5tMUtq?=
 =?utf-8?B?M0poS0U0ZWRsSy9nTnpCOFVULzNlaUU5cDFLYVl1bEJEcmowSlpZM09RWVpE?=
 =?utf-8?B?cVd3bElqeS91ampCdDhqb3F5b2tEamVsSnBGeTVidVJyd2pSS2twK0g1R2NO?=
 =?utf-8?B?Q2NzaFA0bHF5TzhvL1duMittbkF4YnN0Q0pvVk5lUHdqRjBxekVLNUxaRmhL?=
 =?utf-8?B?Nm5xYWVUaGQ5MVZBZ0hSS2tkckVKMGQ0d3FXdWVzL1A0SS90dWg2TklMbjhD?=
 =?utf-8?B?MHRDenllK0EvSVFEWW1Ea2dKSlF6d1pZeFRENEg4VnhWTFR5ME5nV2pqMy9W?=
 =?utf-8?B?K1k3aTIzQ00rSkhEcjBFUCtsSU40UmZEYXdwSzI4TlluaGlVNk9GeG5FKzZh?=
 =?utf-8?B?aVZiYTZIUzBqeDlmcVV2KzNjVzlLZExGaWNRSVBVVHRLWGhoc0JHdHRJbzMr?=
 =?utf-8?B?NGY3U1g3TVpUOWdwU2Y2d3JzN2w1M00zQ1pZN2prWWFKZWc3bHgwVFZsanJF?=
 =?utf-8?B?aTYvWWNyN2ZvVk9CclFDenl0VEVjY1JjdHZuVFdEZGhWYTlZQ0cyaS9uSXds?=
 =?utf-8?B?RE5KSGIvbzMzemxuM2pyUTlpdlRUR2lPOXUrMndmdmRCaXd3VjFhekF2bTFQ?=
 =?utf-8?B?RGh2ek5CMm5BcUpuTXN4SjB5NE1ub0xzSVc0TnZzQzg2WFdZckViRWZKUDFJ?=
 =?utf-8?B?MmRoemdFcjM4bWVWV3RhbUNQOElyOFc5SUVWVXVwaDZ2VW9IdGorZUphL1p3?=
 =?utf-8?B?dUUzQ1ozeW1LaURiZHd6dEEzNDJMQTdqTElNamtqa0syUzJabE9TRVMxbDd6?=
 =?utf-8?B?RDdiQlJpS1VpMEZNYXRKLzdMTlBHVzZtVCswSXFWVUdRQVFkMzBKTmQ4TlRL?=
 =?utf-8?B?bCsxYzlYKzhQNGVCcEJ1Sy9malJ6aWdUUllXVVU3ZXViNTlKSFhJQjdoYndC?=
 =?utf-8?B?SkhCUmNkVklEVnNTb0tJRUlEVmR3dlZncVliQ2xnSVFnNFdBTXBLK083SlUx?=
 =?utf-8?B?K1BUZXpDenZnSUcxazVrcVRJc1UwSElJQXBlNGV4emRvK1dONjdIdG1zU3k3?=
 =?utf-8?B?WW5yS3hyV2ppWTF3dVNRV25KM045SWNiVXJ5UVp1Smt1QW5Wdzg2UWRkOHV0?=
 =?utf-8?B?anl3UG01VjFWdEVJLzJZbXpMZ2tGWkozSG5YQ2FyQm4raUtaeVp2UStmV1E1?=
 =?utf-8?B?NlpQTFVxbFNlT3dDZlJDYVdtTlRtNmFTWDBiYnk3ZjBERmQrQ2lJNmc2RzY4?=
 =?utf-8?B?Z1YzSWtuNW9Uc2RoUlpiMWl1WVNFK0cvQzBQSnZRSVQ0M0VubmNKWU5tb2Jq?=
 =?utf-8?B?YnZzYXNHTHJVejRlYWNZQm05UWNKa2dsWDNES2VUUmxDZXZ0Y1dLRzBLWjRl?=
 =?utf-8?B?c2FVdXNic0pkdFBYQURGRXZjOGZtZlZBdUlvQ1FaeFRMWkJ0N2VBOE9Fb1V2?=
 =?utf-8?B?em1Ob3ZDcGdjWTJVL3MvbU5tbW5OVmJqWHV6cVNoTjdJdVMycDZWZU1xdWgx?=
 =?utf-8?B?T2p6dGxFS0ZUeFkxR1MwTVZsN2c3bWNFZlZCdUs4YmpMNXpVSlBJazdoamtm?=
 =?utf-8?B?VXRsNXYyaG1yTXAzZjZjMS9zTjMwKzZrTFllZTZvOWpodlBkTXhyN1ZvZzBU?=
 =?utf-8?Q?840pMqcqGcbPfJ5A55thW/+A9r8fNMGoc8zEBBL?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0057.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acb994f-b060-4a3c-ee77-08d8eccc20df
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 00:47:54.0006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhA8YtljpkMAsoQLgFRDR/lGWKNm5mzwgJWH6euJJ8Dy+z1lvnaUPAsWGkXwhIwp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2730
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpO
bywgdGhlIHBhdGNoIGZyb20gTmlybW95IGRpZCBub3QgZnVsbHkgZml4IHRoaXMgaXNzdWUuIEkg
d2lsbCBzZW5kIGFub3RoZXIgZml4IHBhdGNoIGxhdGVyLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEs/bmlnDQpTZW50OiAyMDIx5bm0M+aciDIw
5pelIDE3OjA4DQpUbzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsg
UGFuZWVyIFNlbHZhbSwgQXJ1bnByYXZpbiA8QXJ1bnByYXZpbi5QYW5lZXJTZWx2YW1AYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDUv
OF0gZHJtL2FtZGdwdTogdXNlIHRoZSBuZXcgY3Vyc29yIGluIGFtZGdwdV90dG1fYWNjZXNzX21l
bW9yeQ0KDQpZZWFoLCBOaXJtb3kgYWxyZWFkeSBzdHVtYmxlZCBvdmVyIHRoZSBjb3JyZWN0IGZp
eC4NCg0KVGhlIHNpemUgY2hlY2sgaXMgb2ZmIGJ5IG9uZS4gUGF0Y2ggdG8gZml4IHRoaXMgc2hv
dWxkIGJlIHB1c2hlZCBvbiBNb25kYXkuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDE5
LjAzLjIxIHVtIDIyOjIzIHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6DQo+IFRoaXMgaXMgY2F1c2lu
ZyBhIGRlYWRsb2NrIGluIGFtZGdwdV90dG1fYWNjZXNzX21lbW9yeSBkdXJpbmcgdGhlDQo+IFB0
cmFjZUFjY2VzcyB0ZXN0IGluIGtmZHRlc3QuIFVuZm9ydHVuYXRlbHkgaXQgZG9lc24ndCBnZXQg
ZmxhZ2dlZCBieQ0KPiBMT0NLREVQLiBTZWUgdGhlIGtlcm5lbCBsb2cgc25pcHBldCBiZWxvdy4g
SSBkb24ndCBoYXZlIGEgZ29vZA0KPiBleHBsYW5hdGlvbiB3aGF0J3MgZ29pbmcgb24gb3RoZXIg
dGhhbiBtYXliZSBzb21lIGRhdGEgc3RydWN0dXJlDQo+IGNvcnJ1cHRpb24uDQo+DQo+IFdpdGgg
dGhpcyBwYXRjaCByZXZlcnRlZCB0aGUgUHRyYWNlQWNjZXNzIHRlc3Qgc3RpbGwgZmFpbHMsIGJ1
dCBpdA0KPiBkb2Vzbid0IGhhbmcgYW55IG1vcmUuIElmIEkgYWxzbyByZXZlcnQgInVzZSBuZXcg
Y3Vyc29yIGluDQo+IGFtZGdwdV90dG1faW9fbWVtX3BmbiIgKHdoaWNoIGlzIHVzZWQgdmlhIGFt
ZGdwdV9maW5kX21tX25vZGUgaW4NCj4gYW1kZ3B1X3R0bV9hY2Nlc3NfbWVtb3J5KSwgUHRyYWNl
IGFjY2VzcyBzdGFydHMgd29ya2luZyBjb3JyZWN0bHkuDQo+IFRoYXQgdGVsbHMgbWUgdGhhdCB0
aGVyZSBpcyBzb21lIGZ1bmRhbWVudGFsIGJ1ZyBpbiB0aGUgcmVzb3VyY2UNCj4gY3Vyc29yIGlt
cGxlbWVudGF0aW9uIHRoYXQncyBicmVha2luZyBzZXZlcmFsIHVzZXJzLg0KPg0KPiBSZWdhcmRz
LA0KPiAgIEZlbGl4DQo+DQo+DQo+IFsgIDEyOS40NDYwODVdIHdhdGNoZG9nOiBCVUc6IHNvZnQg
bG9ja3VwIC0gQ1BVIzggc3R1Y2sgZm9yIDIycyENCj4gW2tmZHRlc3Q6MzU4OF0NCj4gWyAgMTI5
LjQ1NTM3OV0gTW9kdWxlcyBsaW5rZWQgaW46IGlwNnRhYmxlX2ZpbHRlciBpcDZfdGFibGVzDQo+
IGlwdGFibGVfZmlsdGVyIGFtZGdwdSB4ODZfcGtnX3RlbXBfdGhlcm1hbCBkcm1fdHRtX2hlbHBl
ciB0dG0gaW9tbXVfdjINCj4gZ3B1X3NjaGVkIGlwX3RhYmxlcyB4X3RhYmxlcyBbICAxMjkuNDU1
NDI4XSBpcnEgZXZlbnQgc3RhbXA6IDc1Mjk0MDAwDQo+IFsgIDEyOS40NTU0MzJdIGhhcmRpcnFz
IGxhc3QgIGVuYWJsZWQgYXQgKDc1MjkzOTk5KToNCj4gWzxmZmZmZmZmZmE5ZGNmZDdkPl0gX3Jh
d19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4MmQvMHg0MA0KPiBbICAxMjkuNDU1NDQ3XSBoYXJk
aXJxcyBsYXN0IGRpc2FibGVkIGF0ICg3NTI5NDAwMCk6DQo+IFs8ZmZmZmZmZmZhOWRiZWY4YT5d
IHN5c3ZlY19hcGljX3RpbWVyX2ludGVycnVwdCsweGEvMHhhMA0KPiBbICAxMjkuNDU1NDU3XSBz
b2Z0aXJxcyBsYXN0ICBlbmFibGVkIGF0ICg3NTE4NDAwMCk6DQo+IFs8ZmZmZmZmZmZhYTAwMDMw
Nj5dIF9fZG9fc29mdGlycSsweDMwNi8weDQyOSBbICAxMjkuNDU1NDY3XSBzb2Z0aXJxcw0KPiBs
YXN0IGRpc2FibGVkIGF0ICg3NTE4Mzk5NSk6DQo+IFs8ZmZmZmZmZmZhOWUwMGY4Zj5dIGFzbV9j
YWxsX2lycV9vbl9zdGFjaysweGYvMHgyMCBbICAxMjkuNDU1NDc3XQ0KPiBDUFU6IDggUElEOiAz
NTg4IENvbW06IGtmZHRlc3QgTm90IHRhaW50ZWQgNS4xMS4wLWtmZC1ma3VlaGxpbiAjMTk0IFsN
Cj4gMTI5LjQ1NTQ4NV0gSGFyZHdhcmUgbmFtZTogQVNVUyBBbGwgU2VyaWVzL1g5OS1FIFdTL1VT
QiAzLjEsIEJJT1MNCj4gMzIwMSAwNi8xNy8yMDE2DQo+IFsgIDEyOS40NTU0OTBdIFJJUDogMDAx
MDpfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4Yi8weDUwDQo+IFsgIDEyOS40NTU0OThdIENvZGU6
IGQyIDMxIGY2IGU4IGU3IGU5IDMxIGZmIDQ4IDg5IGRmIDU4IDViIGU5IDdkIDMyDQo+IDMyIGZm
IDBmIDFmIDAwIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDU1
IDQ4IDg5DQo+IGZkIDUzIDljIDw1Yj4gZmEgZjYgYzcgMDIgNzQgMDUgZTggNTkgMDYgM2UgZmYg
NjUgZmYgMDUgOTIgNzMgMjQgNTYgNDgNCj4gOGQgN2QgWyAgMTI5LjQ1NTUwNV0gUlNQOiAwMDE4
OmZmZmZhM2ViNDA3ZjNjNTggRUZMQUdTOiAwMDAwMDI0NiBbDQo+IDEyOS40NTU1MTNdIFJBWDog
ZmZmZjk2NDY2ZTIwMTBhMCBSQlg6IGZmZmY5NjQ2NmUyMDAwMDAgUkNYOg0KPiAwMDAwMDAwMDAw
MDAwMDAwDQo+IFsgIDEyOS40NTU1MTldIFJEWDogZmZmZmEzZWI0MDdmM2U3MCBSU0k6IDAwMDAw
MDAwMDE5ZmZmZjAgUkRJOg0KPiBmZmZmOTY0NjZlMjAxMGEwDQo+IFsgIDEyOS40NTU1MjRdIFJC
UDogZmZmZjk2NDY2ZTIwMTBhMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5Og0KPiAwMDAwMDAw
MDAwMDAwMDAxDQo+IFsgIDEyOS40NTU1MjhdIFIxMDogZmZmZmEzZWI0MDdmM2M2MCBSMTE6IGZm
ZmY5NjQ2NmUyMDEwYjggUjEyOg0KPiAwMDAwMDAwMDAxOWZmZmYwDQo+IFsgIDEyOS40NTU1MzNd
IFIxMzogMDAwMDAwMDAwMTlmZmZmMCBSMTQ6IGZmZmZhM2ViNDA3ZjNlNzAgUjE1Og0KPiAwMDAw
MDAwMDAxOWZmZmYwDQo+IFsgIDEyOS40NTU1MzhdIEZTOiAgMDAwMDdmNWFhZDBmMDc0MCgwMDAw
KSBHUzpmZmZmOTY0NjdmYzAwMDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4g
WyAgMTI5LjQ1NTU0NF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4
MDA1MDAzMyBbDQo+IDEyOS40NTU1NDldIENSMjogMDAwMDU2M2VhNzZhZDBmMCBDUjM6IDAwMDAw
MDA3YzZlOTIwMDUgQ1I0Og0KPiAwMDAwMDAwMDAwMTcwNmUwDQo+IFsgIDEyOS40NTU1NTRdIENh
bGwgVHJhY2U6DQo+IFsgIDEyOS40NTU1NjNdICBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKzB4
YzEvMHgyMDAgW2FtZGdwdV0gWw0KPiAxMjkuNDU1ODIwXSAgPyBfcmF3X3NwaW5fdW5sb2NrX2ly
cXJlc3RvcmUrMHgyZC8weDQwDQo+IFsgIDEyOS40NTU4MzRdICBhbWRncHVfdHRtX2FjY2Vzc19t
ZW1vcnkrMHgyOWUvMHgzMjAgW2FtZGdwdV0gWw0KPiAxMjkuNDU2MDYzXSAgdHRtX2JvX3ZtX2Fj
Y2VzcysweDFjOC8weDNhMCBbdHRtXSBbICAxMjkuNDU2MDg5XQ0KPiBfX2FjY2Vzc19yZW1vdGVf
dm0rMHgyODkvMHgzOTAgWyAgMTI5LjQ1NjExMl0NCj4gcHRyYWNlX2FjY2Vzc192bSsweDk4LzB4
YzAgWyAgMTI5LjQ1NjEyN10NCj4gZ2VuZXJpY19wdHJhY2VfcGVla2RhdGErMHgzMS8weDgwIFsg
IDEyOS40NTYxMzhdDQo+IHB0cmFjZV9yZXF1ZXN0KzB4MTNiLzB4NWQwIFsgIDEyOS40NTYxNTVd
ICBhcmNoX3B0cmFjZSsweDI0Zi8weDJmMCBbDQo+IDEyOS40NTYxNjVdICBfX3g2NF9zeXNfcHRy
YWNlKzB4YzkvMHgxNDAgWyAgMTI5LjQ1NjE3N10NCj4gZG9fc3lzY2FsbF82NCsweDJkLzB4NDAg
WyAgMTI5LjQ1NjE4NV0NCj4gZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhh
OQ0KPiBbICAxMjkuNDU2MTk0XSBSSVA6IDAwMzM6MHg3ZjVhYWI4NjFhM2YgWyAgMTI5LjQ1NjE5
OV0gQ29kZTogNDggODkgNDQNCj4gMjQgMTggNDggOGQgNDQgMjQgMzAgYzcgNDQgMjQgMTAgMTgg
MDANCj4gMDAgMDAgOGIgNzAgMDggNDggOGIgNTAgMTAgNDggODkgNDQgMjQgMjAgNGMgMGYgNDMg
NTAgMTggYjggNjUgMDAgMDANCj4gMDAgMGYgMDUgPDQ4PiAzZCAwMCBmMCBmZiBmZiA3NyA0MSA0
OCA4NSBjMCA3OCAwNiA0MSA4MyBmOCAwMiA3NiAxZSA0OA0KPiA4YiA0YyBbICAxMjkuNDU2MjA1
XSBSU1A6IDAwMmI6MDAwMDdmZmQyN2I2ODc1MCBFRkxBR1M6IDAwMDAwMjkzDQo+IE9SSUdfUkFY
Og0KPiAwMDAwMDAwMDAwMDAwMDY1DQo+IFsgIDEyOS40NTYyMTRdIFJBWDogZmZmZmZmZmZmZmZm
ZmZkYSBSQlg6IDAwMDAwMDAwMDAwMDAwMDEgUkNYOg0KPiAwMDAwN2Y1YWFiODYxYTNmDQo+IFsg
IDEyOS40NTYyMTldIFJEWDogMDAwMDdmNWFhYjNmZmZmMCBSU0k6IDAwMDAwMDAwMDAwMDBkZmEg
UkRJOg0KPiAwMDAwMDAwMDAwMDAwMDAyDQo+IFsgIDEyOS40NTYyMjRdIFJCUDogMDAwMDdmZmQy
N2I2ODg3MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDEgUjA5Og0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+
IFsgIDEyOS40NTYyMjhdIFIxMDogMDAwMDdmZmQyN2I2ODc1OCBSMTE6IDAwMDAwMDAwMDAwMDAy
OTMgUjEyOg0KPiAwMDAwNTYzZWE3NjRlMmFhDQo+IFsgIDEyOS40NTYyMzNdIFIxMzogMDAwMDAw
MDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMjEgUjE1Og0KPiAwMDAwMDAwMDAwMDAwMDAw
DQo+DQo+IE9uIDIwMjEtMDMtMDggODo0MCBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
Pj4gU2VwYXJhdGUgdGhlIGRybV9tbV9ub2RlIHdhbGtpbmcgZnJvbSB0aGUgYWN0dWFsIGhhbmRs
aW5nLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCj4+IEFja2VkLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4N
Cj4+IFRlc3RlZC1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPg0KPj4gLS0tDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDY3DQo+PiArKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCA0OSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYw0KPj4gaW5kZXggNTE3NjExYjcwOWZhLi4yY2JlNGFjZTU5MWYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4gQEAgLTE3OCwy
NiArMTc4LDYgQEAgc3RhdGljIGludCBhbWRncHVfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QNCj4+IHR0
bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IGZpbGUgKmZpbHApDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBmaWxwLT5wcml2YXRlX2RhdGEpOw0KPj4gICB9DQo+PiAgIC0vKioNCj4+IC0g
KiBhbWRncHVfZmluZF9tbV9ub2RlIC0gSGVscGVyIGZ1bmN0aW9uIGZpbmRzIHRoZSBkcm1fbW1f
bm9kZQ0KPj4gY29ycmVzcG9uZGluZyB0bw0KPj4gLSAqIEBvZmZzZXQuIEl0IGFsc28gbW9kaWZp
ZXMgdGhlIG9mZnNldCB0byBiZSB3aXRoaW4gdGhlIGRybV9tbV9ub2RlDQo+PiByZXR1cm5lZA0K
Pj4gLSAqDQo+PiAtICogQG1lbTogVGhlIHJlZ2lvbiB3aGVyZSB0aGUgYm8gcmVzaWRlcy4NCj4+
IC0gKiBAb2Zmc2V0OiBUaGUgb2Zmc2V0IHRoYXQgZHJtX21tX25vZGUgaXMgdXNlZCBmb3IgZmlu
ZGluZy4NCj4+IC0gKg0KPj4gLSAqLw0KPj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX21tX25vZGUgKmFt
ZGdwdV9maW5kX21tX25vZGUoc3RydWN0IHR0bV9yZXNvdXJjZQ0KPj4gKm1lbSwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCAqb2Zmc2V0KSAtew0KPj4gLSAgICBzdHJ1
Y3QgZHJtX21tX25vZGUgKm1tX25vZGUgPSBtZW0tPm1tX25vZGU7DQo+PiAtDQo+PiAtICAgIHdo
aWxlICgqb2Zmc2V0ID49IChtbV9ub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQpKSB7DQo+PiAtICAg
ICAgICAqb2Zmc2V0IC09IChtbV9ub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQpOw0KPj4gLSAgICAg
ICAgKyttbV9ub2RlOw0KPj4gLSAgICB9DQo+PiAtICAgIHJldHVybiBtbV9ub2RlOw0KPj4gLX0N
Cj4+IC0NCj4+ICAgLyoqDQo+PiAgICAqIGFtZGdwdV90dG1fbWFwX2J1ZmZlciAtIE1hcCBtZW1v
cnkgaW50byB0aGUgR0FSVCB3aW5kb3dzDQo+PiAgICAqIEBibzogYnVmZmVyIG9iamVjdCB0byBt
YXANCj4+IEBAIC0xNDc4LDQxICsxNDU4LDM2IEBAIHN0YXRpYyBib29sDQo+PiBhbWRncHVfdHRt
X2JvX2V2aWN0aW9uX3ZhbHVhYmxlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+PiAg
ICAqIGFjY2VzcyBmb3IgZGVidWdnaW5nIHB1cnBvc2VzLg0KPj4gICAgKi8NCj4+ICAgc3RhdGlj
IGludCBhbWRncHVfdHRtX2FjY2Vzc19tZW1vcnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywNCj4+IC0gICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LA0KPj4gLSAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqYnVmLCBpbnQgbGVuLCBpbnQgd3JpdGUpDQo+PiArICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG9mZnNldCwgdm9pZCAqYnVmLCBpbnQgbGVu
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgaW50IHdyaXRlKQ0KPj4gICB7DQo+PiAgICAgICBz
dHJ1Y3QgYW1kZ3B1X2JvICphYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGJvKTsNCj4+ICAgICAgIHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGFiby0+dGJvLmJkZXYp
Ow0KPj4gLSAgICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOw0KPj4gKyAgICBzdHJ1Y3QgYW1k
Z3B1X3Jlc19jdXJzb3IgY3Vyc29yOw0KPj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4g
ICAgICAgdWludDMyX3QgdmFsdWUgPSAwOw0KPj4gICAgICAgaW50IHJldCA9IDA7DQo+PiAtICAg
IHVpbnQ2NF90IHBvczsNCj4+IC0gICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+ICAgICAgICAg
aWYgKGJvLT5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1ZSQU0pDQo+PiAgICAgICAgICAgcmV0dXJu
IC1FSU87DQo+PiAgIC0gICAgcG9zID0gb2Zmc2V0Ow0KPj4gLSAgICBub2RlcyA9IGFtZGdwdV9m
aW5kX21tX25vZGUoJmFiby0+dGJvLm1lbSwgJnBvcyk7DQo+PiAtICAgIHBvcyArPSAobm9kZXMt
PnN0YXJ0IDw8IFBBR0VfU0hJRlQpOw0KPj4gLQ0KPj4gLSAgICB3aGlsZSAobGVuICYmIHBvcyA8
IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCj4+IC0gICAgICAgIHVpbnQ2NF90IGFsaWduZWRf
cG9zID0gcG9zICYgfih1aW50NjRfdCkzOw0KPj4gLSAgICAgICAgdWludDY0X3QgYnl0ZXMgPSA0
IC0gKHBvcyAmIDMpOw0KPj4gLSAgICAgICAgdWludDMyX3Qgc2hpZnQgPSAocG9zICYgMykgKiA4
Ow0KPj4gKyAgICBhbWRncHVfcmVzX2ZpcnN0KCZiby0+bWVtLCBvZmZzZXQsIGxlbiwgJmN1cnNv
cik7DQo+PiArICAgIHdoaWxlIChjdXJzb3IucmVtYWluaW5nKSB7DQo+PiArICAgICAgICB1aW50
NjRfdCBhbGlnbmVkX3BvcyA9IGN1cnNvci5zdGFydCAmIH4odWludDY0X3QpMzsNCj4+ICsgICAg
ICAgIHVpbnQ2NF90IGJ5dGVzID0gNCAtIChjdXJzb3Iuc3RhcnQgJiAzKTsNCj4+ICsgICAgICAg
IHVpbnQzMl90IHNoaWZ0ID0gKGN1cnNvci5zdGFydCAmIDMpICogODsNCj4+ICAgICAgICAgICB1
aW50MzJfdCBtYXNrID0gMHhmZmZmZmZmZiA8PCBzaGlmdDsNCj4+ICAgLSAgICAgICAgaWYgKGxl
biA8IGJ5dGVzKSB7DQo+PiAtICAgICAgICAgICAgbWFzayAmPSAweGZmZmZmZmZmID4+IChieXRl
cyAtIGxlbikgKiA4Ow0KPj4gLSAgICAgICAgICAgIGJ5dGVzID0gbGVuOw0KPj4gKyAgICAgICAg
aWYgKGN1cnNvci5zaXplIDwgYnl0ZXMpIHsNCj4+ICsgICAgICAgICAgICBtYXNrICY9IDB4ZmZm
ZmZmZmYgPj4gKGJ5dGVzIC0gY3Vyc29yLnNpemUpICogODsNCj4+ICsgICAgICAgICAgICBieXRl
cyA9IGN1cnNvci5zaXplOw0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgICAgICAgIGlmIChtYXNr
ICE9IDB4ZmZmZmZmZmYpIHsNCj4+ICAgICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmFk
ZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsNCj4+ICAgICAgICAgICAgICAgV1JFRzMyX05PX0tJ
UShtbU1NX0lOREVYLCAoKHVpbnQzMl90KWFsaWduZWRfcG9zKSB8DQo+PiAweDgwMDAwMDAwKTsN
Cj4+ICAgICAgICAgICAgICAgV1JFRzMyX05PX0tJUShtbU1NX0lOREVYX0hJLCBhbGlnbmVkX3Bv
cyA+PiAzMSk7DQo+PiAtICAgICAgICAgICAgaWYgKCF3cml0ZSB8fCBtYXNrICE9IDB4ZmZmZmZm
ZmYpDQo+PiAtICAgICAgICAgICAgICAgIHZhbHVlID0gUlJFRzMyX05PX0tJUShtbU1NX0RBVEEp
Ow0KPj4gKyAgICAgICAgICAgIHZhbHVlID0gUlJFRzMyX05PX0tJUShtbU1NX0RBVEEpOw0KPj4g
ICAgICAgICAgICAgICBpZiAod3JpdGUpIHsNCj4+ICAgICAgICAgICAgICAgICAgIHZhbHVlICY9
IH5tYXNrOw0KPj4gICAgICAgICAgICAgICAgICAgdmFsdWUgfD0gKCoodWludDMyX3QgKilidWYg
PDwgc2hpZnQpICYgbWFzazsgQEANCj4+IC0xNTI0LDIxICsxNDk5LDE1IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3R0bV9hY2Nlc3NfbWVtb3J5KHN0cnVjdA0KPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LA0KPj4gICAgICAgICAgICAgICAgICAgbWVtY3B5KGJ1ZiwgJnZhbHVlLCBieXRlcyk7DQo+PiAg
ICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgICB9IGVsc2Ugew0KPj4gLSAgICAgICAgICAgIGJ5
dGVzID0gKG5vZGVzLT5zdGFydCArIG5vZGVzLT5zaXplKSA8PCBQQUdFX1NISUZUOw0KPj4gLSAg
ICAgICAgICAgIGJ5dGVzID0gbWluKGJ5dGVzIC0gcG9zLCAodWludDY0X3QpbGVuICYgfjB4M3Vs
bCk7DQo+PiAtDQo+PiAtICAgICAgICAgICAgYW1kZ3B1X2RldmljZV92cmFtX2FjY2VzcyhhZGV2
LCBwb3MsICh1aW50MzJfdCAqKWJ1ZiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGJ5
dGVzLCB3cml0ZSk7DQo+PiArICAgICAgICAgICAgYnl0ZXMgPSBjdXJzb3Iuc2l6ZSAmIDB4M3Vs
bDsNCj4+ICsgICAgICAgICAgICBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKGFkZXYsIGN1cnNv
ci5zdGFydCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50MzJfdCAqKWJ1Ziwg
Ynl0ZXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICB3cml0ZSk7DQo+PiAgICAgICAg
ICAgfQ0KPj4gICAgICAgICAgICAgcmV0ICs9IGJ5dGVzOw0KPj4gICAgICAgICAgIGJ1ZiA9ICh1
aW50OF90ICopYnVmICsgYnl0ZXM7DQo+PiAtICAgICAgICBwb3MgKz0gYnl0ZXM7DQo+PiAtICAg
ICAgICBsZW4gLT0gYnl0ZXM7DQo+PiAtICAgICAgICBpZiAocG9zID49IChub2Rlcy0+c3RhcnQg
KyBub2Rlcy0+c2l6ZSkgPDwgUEFHRV9TSElGVCkgew0KPj4gLSAgICAgICAgICAgICsrbm9kZXM7
DQo+PiAtICAgICAgICAgICAgcG9zID0gKG5vZGVzLT5zdGFydCA8PCBQQUdFX1NISUZUKTsNCj4+
IC0gICAgICAgIH0NCj4+ICsgICAgICAgIGFtZGdwdV9yZXNfbmV4dCgmY3Vyc29yLCBieXRlcyk7
DQo+PiAgICAgICB9DQo+PiAgICAgICAgIHJldHVybiByZXQ7DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q3hpbmh1
aS5wYW4lNDBhbWQuY29tJTdDOWVlN2E4YmVmOGVhNDBlMzdkYWMwOGQ4ZWI3ZmFmNzMlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NTE4MjgwOTI2MTY5MzI2
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPW5jSUJ3
ZlB0c3Z3Mzc5aWhXNDdjYmNoSHdCUkFyUVYlMkI1R0I4d3BZNXlsYyUzRCZhbXA7cmVzZXJ2ZWQ9
MA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
