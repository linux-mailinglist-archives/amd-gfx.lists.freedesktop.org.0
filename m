Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98823589AF
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Apr 2021 18:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B2E6EB68;
	Thu,  8 Apr 2021 16:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2106EB68
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Apr 2021 16:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A06lCTtodEjmHojcuI/pL3C9ohftPz6CV0ME/dIQsk7ccS0gsBH9jEfUybqyzZhJk5Lun3V1mYDW2TfSvqqVY3ahKJKYmYx19AbYGl1LrvxqwT92tmHchYWgDlFBHyOdv9RMgqzwG8KM9wg/QySfVETDS+uNm92E7HGhi1+hnECAX7Al+5wfIql0q9In+O3hdMYjP7AszFid9tGR2hArLq9rMnqh4AmXklKecV2XY9lBmOcgTXt50ueZ+qgWsW77c1O/NmKgK4vsUtiK92cc7Cy83RzGnS6d9f3WbRxAa/qJjER+hvBd2iIMn34u9ZELMN8mOVj+jczPdYlBe17Dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E27jcWy4bxMMif4BX/hINoLURfcaiZJsejs+1+u05oY=;
 b=N/iYq3XZ2xMUy3piuW9wTZOLGl82XwcWQjxlnW8A4o/UZ5gF//f/DJOHt7m2cFOKRZidU0e/tGjw8rYs15SWUOZ+JW1vYSLCk/ijUN1LN46xuO9bRqVLnz7p+U767BzcggMYV430KD1FrJSkHw09EgK7xpfsi4vCFilmW4oSTIkVg9uV4WffVaFgQEpFB00ZmtwuiT7CqjaRDRR4XJIlRPNUNuf/nGQTV/i4AYFG5IKj37uJgazbvU88/23gCxVKqQkXvOkq/1so5Iq0/CWkc+rvJ2hXivGJyuR/eQe8ZwfGN7xxAM0DwiGws7H7jyGE0zlCXNnu3QTVl/GFGZZukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E27jcWy4bxMMif4BX/hINoLURfcaiZJsejs+1+u05oY=;
 b=r0bD5h8p0TvItbivw9t/O/ATgh3I1x9c1uhBnP1Y7IQJ4JDK2uQbinUXWxWHCSQmQ7hSg7p8ag3v3wW/UcHFoGmFjuLv0NPKXXiyuEXC4BL+qTOKadVdXUBNMafLGHbxLlStx2LIIAvm3pm+UtbYqh/ef94a2IoQF1fzryVMc3w=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 16:25:10 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::6c8a:904f:7403:8d60]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::6c8a:904f:7403:8d60%5]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 16:25:10 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "R, Bindu" <Bindu.R@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Update DCN302 SR Exit Latency
Thread-Topic: [PATCH] drm/amd/display: Update DCN302 SR Exit Latency
Thread-Index: AQHXLI6cAeSFAzqOM0O/Gep2eOGKXKqqxheAgAAHVjs=
Date: Thu, 8 Apr 2021 16:25:10 +0000
Message-ID: <CH0PR12MB5284FD042B80627C641F56D18B749@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20210408154821.729834-1-aurabindo.pillai@amd.com>,
 <DM4PR12MB5120EC535F3450809DF84D60F5749@DM4PR12MB5120.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5120EC535F3450809DF84D60F5749@DM4PR12MB5120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-08T16:25:10.467Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 979ff1b6-5d4a-47ff-bdf2-08d8faaae196
x-ms-traffictypediagnostic: CH0PR12MB5313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR12MB5313880FDB38A14DAB9F037C8B749@CH0PR12MB5313.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wkMf2XrqCJUQkiiNUmlNZrhoUTQm/D/y0NgHFk2vBgYr/cgkezE27/zTDiKo+ahC5mGSTcgKFXzp2bWjVic3geDi4U6pdNf5hagKpIRYT3O7RniYOf+j3w2gVy6JOlNtvc281s48AOfJ/dt9J7kXB2+AbgUbcLPh7WNqHtx3DCpSLeTvti3L5tWrnF2Adlynl64RRpvMCOIiqMl3ltNc85hcDJQcGf7+ufhCNhbDsVlv9VHIp5++xB7ezCiNmU42QpM3+QJSv00aF/xlPXVB+J2THbz4a2VoPBnLfmZFhTIaPE0wgbYa7S0fyjklGrO1xTEWZNyboeUkt4hsEkb8w17Lk0Y5x8w2fassmZrGeWHbhsNyLj0v+IXxbEvm3VDvFyROIpFA+RgBDyTmcyl8yYLYxd42XIO1KW5uqMcCCySPw3qAYTLUulF6okYf8+udJHAPbFB3iBZHFXl4ldKvfTAQl/HCjEyyYMZbsdXMLTOKyOqlQCNHg50HPMucNu8aFt+Np+p5Fp+tmSh61NHtT8QHvpa9Bf6Yem3fN5/bJU4et41jjKcdNihQnn73sYENphJVAdJkR/arLCmMCYJxvFG+mxdNTIYZUBOVYvYRBjuwFG8fIIs2C+7n0N4weeGOP72SqCymt0cJcaq/m5rn2xz1EqKyC9FQybzGKmP+EY0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(6506007)(33656002)(8676002)(9686003)(52536014)(2906002)(19627405001)(478600001)(71200400001)(186003)(55016002)(86362001)(4326008)(53546011)(66476007)(76116006)(15650500001)(316002)(26005)(66946007)(7696005)(64756008)(5660300002)(8936002)(83380400001)(110136005)(66446008)(38100700001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bVhuZFZXQm9CcUR1RjFLa05GVy9md2VkNWg2TWZMQ2p2QVpiczk0WENLdm53?=
 =?utf-8?B?SVhxVkh2WjdzMExoU25PMGNxemt6cVNwSXRtazhYSmxiZWtCbUZzUE1PUW5q?=
 =?utf-8?B?S2pGSDYvYkJYaHYraDlzTS9uOU9xUmlnMVlVZkpuTmtiOVdvY3Y0VWE1cXA4?=
 =?utf-8?B?bTYvUWppVGhJdC9McnlsMGphTTBvbHE1eEx5bXczWUg5aUI1V3pUOW5JZ2VN?=
 =?utf-8?B?RGpQZEhIblhsV2RmSmo0Q2xqVkxxNnA5K3E5ZEFkdXphMVlxcWdpb2lDVjJC?=
 =?utf-8?B?dHJJd0pKQnU1STZOaXduZHcwTCsxWlBScGVPaHV2cFRTdFdQbVVDQkNramFK?=
 =?utf-8?B?RnR6bExYcGtDRGpRR0phNnUzZTBlaFJtWVB2NkIvN3paQTlob2M4YUpQaVdU?=
 =?utf-8?B?dTRpc2tIN1cyZmpIZnZOYlE2SHRiN0NPN1VsM25tbHJSK2IxaVBtTWtzV055?=
 =?utf-8?B?aS83SWdiQUdWS3YveHFnMlcvZTRuTnpacUsxVW44OFE0R2p5OVp3UTR6WWFW?=
 =?utf-8?B?V09KNVJITUorcThXZW4xS2ZpUTNZaHEzTStWdjBlOWRnV29VUFUza3dHdllJ?=
 =?utf-8?B?ZHlGOC9md0RyWnJJU09VTkFZTEUxbWtQWVFhbHN6N1V6SXM3Mzhwdm0zTTQx?=
 =?utf-8?B?bEYzanBVb0huYWFidVJqdm4yRjVVelA3eDRmVGoyWTFJMTR0cEZJUHVuV0tu?=
 =?utf-8?B?a0xpUEt6M0ZXanN6T1orZ1BzVDR0SjBiYnk1Smp0NnpYbGRqTytscFljZlVp?=
 =?utf-8?B?bXFqZjQvQVBhYS9OSlhOejlxeW1yTkpNRkVvKy9BZjRGRkVud0JzTG1teW8v?=
 =?utf-8?B?cEh2ZGlWWG15MW9zSVdWb296SUNZeExXSEp1VWlST3JrVkNwakJuZk5wemtl?=
 =?utf-8?B?UjV1RjZxbWZDcFU2LzlSR1g2SmZXeGt2Tm5jamk1MDVRdFBMdm5IMEhKNnZV?=
 =?utf-8?B?dmtLTnRqcnhlUVdtcjFCU29scHZNSUJFWk5vMy8yQTRHZ1RueGxWYXVEY3NR?=
 =?utf-8?B?TGdVYVhQQXJsSHJ2YTBUL1N3cFFxQjI2djB5czYyWDRvNmpSK0xtTGNpbzM4?=
 =?utf-8?B?d2cxT2o4aVVpVXZ3RnU0Wkd3RjdiUHhCZlRoU0lLc3VrSmdTelNKS2xUbHVM?=
 =?utf-8?B?WUdMcW0yZVlRaGFxd3MxUU5nVUpRaVhDQmN4dG5XYzk3cmYvMkFpc0lza21W?=
 =?utf-8?B?TWNoL2FVd0R5K1VQbHY5ZXQyeHZOelZDbTdYSjBHQktsamdQeDF1MHFBbmE2?=
 =?utf-8?B?b1c0S2Q3VWtjUFlVb2g5NTZSd1dseGNkNlcwMWRHZWp6SFBBdm9kS21pREg5?=
 =?utf-8?B?ZFRnVHpWWjNGMFNYOWVWUkNsVkIzNTZwNmk5NWR2L3BpUzlXOTQwS1RQbGZ4?=
 =?utf-8?B?NGQ4ZTh3dkhLcWQrNkFKUStBZzRKbFdpTzVzckt0Z1NocGk3Rkl2SXF4VEJE?=
 =?utf-8?B?Tys4Qkt3dnI1bi9oemVuV1BiZmlqaVdUcXVqaU1wMkRyeERNT2YwN1M5THpN?=
 =?utf-8?B?dXR4WGF0K2h6clNrLzJHVkw5d2ZsVFJ1Rm4zdW5NMDVONU9nVXI0eXNyUW94?=
 =?utf-8?B?Vm4wNjNvMEJWWE9PRkJSRDdlaFVCOXlXd0xsbHozd05TWGZ5d21OelFpaTBw?=
 =?utf-8?B?UC9ja2o5T1Rkak9nbUN5amJMN0tzcnpjUUZFY3lnOUp1b3FGbFdoTzVmbTgy?=
 =?utf-8?B?U2dXWDNOdFVPS3VINnBoOFMrOVFqYTg5SnVMTXEvN3BuY1VNOWZJQzBQMkV5?=
 =?utf-8?Q?9t26/YXbCnPy8uD3MpuZ2uGgd2I+yP3ESatqyn+?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979ff1b6-5d4a-47ff-bdf2-08d8faaae196
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 16:25:10.7409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdG6J1//5w5T2l1syeHJ6cCVvdViQozMsz1ppu0BEmFZLcbkLJFBsom8GDWaNuFEuMislErgImJ8Y36pZsV71Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
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
Cc: "Aberback, Joshua" <Joshua.Aberback@amd.com>
Content-Type: multipart/mixed; boundary="===============1076559108=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1076559108==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB5284FD042B80627C641F56D18B749CH0PR12MB5284namp_"

--_000_CH0PR12MB5284FD042B80627C641F56D18B749CH0PR12MB5284namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBCaW5kdSwNCg0KVGhlIHZhbHVlIGlzIHJlY29tbWVuZGVkIGJ5IHRoZSBoYXJkd2FyZSB0ZWFt
LiBTaW5jZSBhIG5vbi1yZWNvbW1lbmRlZCB2YWx1ZSB3YXMgYmVpbmcgdXNlZCwgdGhhdCBpdHNl
bGYgaXMgdGhlIHJvb3QgY2F1c2UuIEkgd2lsbCBhZGQgdGhpcyB0byBjb21taXQgbWVzc2FnZS4N
Cg0KLS0NCg0KVGhhbmtzICYgUmVnYXJkcywNCkF1cmFiaW5kbyBQaWxsYWkNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBSLCBCaW5kdSA8QmluZHUuUkBhbWQuY29tPg0K
U2VudDogVGh1cnNkYXksIEFwcmlsIDgsIDIwMjEgMTE6NTUgQU0NClRvOiBQaWxsYWksIEF1cmFi
aW5kbyA8QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KQ2M6IEFiZXJiYWNrLCBKb3No
dWEgPEpvc2h1YS5BYmVyYmFja0BhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2Ft
ZC9kaXNwbGF5OiBVcGRhdGUgRENOMzAyIFNSIEV4aXQgTGF0ZW5jeQ0KDQoNCltBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCg0K4oCLSGkgSmF5LA0K
ICAgQ291bGQgeW91IHBsZWFzZSBhZGQgZmV3IGRldGFpbHMgb24gdGhlIHJvb3QgY2F1c2UsIGlu
IHRoZSBbV2h5L0hvd10gc2VjdGlvbj8NCg0KVGhhbmtzLA0KQmluZHUNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpGcm9tOiBBdXJhYmluZG8gUGlsbGFpIDxhdXJhYmluZG8ucGls
bGFpQGFtZC5jb20+DQpTZW50OiBUaHVyc2RheSwgQXByaWwgOCwgMjAyMSAxMTo0OCBBTQ0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4NCkNjOiBQaWxsYWksIEF1cmFiaW5kbyA8QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPjsg
UiwgQmluZHUgPEJpbmR1LlJAYW1kLmNvbT47IEFiZXJiYWNrLCBKb3NodWEgPEpvc2h1YS5BYmVy
YmFja0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IFVwZGF0ZSBE
Q04zMDIgU1IgRXhpdCBMYXRlbmN5DQoNCkZyb206IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFi
ZXJiYWNrQGFtZC5jb20+DQoNCltXaHldDQpVcGRhdGUgU1IgRXhpdCBMYXRlbmN5IHRvIGZpeCBz
Y3JlZW4gZmxpY2tlcmluZyBjYXVzZWQgZHVlIHRvIE9URw0KdW5kZXJmbG93DQoNClNpZ25lZC1v
ZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5jb20+DQpBY2tlZC1i
eTogQXVyYWJpbmRvIFBpbGxhaSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tPg0KLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwMi9kY24zMDJfcmVzb3VyY2UuYyB8IDIg
Ky0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDIvZGNuMzAyX3Jl
c291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzAyL2RjbjMwMl9y
ZXNvdXJjZS5jDQppbmRleCBhOTI4YzFkOWE1NTcuLmZjMmRlYTI0M2QxYiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDIvZGNuMzAyX3Jlc291cmNlLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDIvZGNuMzAyX3Jlc291
cmNlLmMNCkBAIC0xNjQsNyArMTY0LDcgQEAgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGluZ19i
b3hfc3QgZGNuM18wMl9zb2MgPSB7DQoNCiAgICAgICAgICAgICAgICAgLm1pbl9kY2ZjbGsgPSA1
MDAuMCwgLyogVE9ETzogc2V0IHRoaXMgdG8gYWN0dWFsIG1pbiBEQ0ZDTEsgKi8NCiAgICAgICAg
ICAgICAgICAgLm51bV9zdGF0ZXMgPSAxLA0KLSAgICAgICAgICAgICAgIC5zcl9leGl0X3RpbWVf
dXMgPSAxMiwNCisgICAgICAgICAgICAgICAuc3JfZXhpdF90aW1lX3VzID0gMTUuNSwNCiAgICAg
ICAgICAgICAgICAgLnNyX2VudGVyX3BsdXNfZXhpdF90aW1lX3VzID0gMjAsDQogICAgICAgICAg
ICAgICAgIC51cmdlbnRfbGF0ZW5jeV91cyA9IDQuMCwNCiAgICAgICAgICAgICAgICAgLnVyZ2Vu
dF9sYXRlbmN5X3BpeGVsX2RhdGFfb25seV91cyA9IDQuMCwNCi0tDQoyLjMxLjENCg0K

--_000_CH0PR12MB5284FD042B80627C641F56D18B749CH0PR12MB5284namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpBcmlh
bDtmb250LXNpemU6MTFwdDtjb2xvcjojMDA3OEQ3O21hcmdpbjo1cHQ7IiBhbGlnbj0iTGVmdCI+
DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldPGJy
Pg0KPC9wPg0KPGJyPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPg0KSGkgQmlu
ZHUsPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyBi
YWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xv
cjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+DQpUaGUgdmFsdWUgaXMgcmVjb21tZW5kZWQgYnkgdGhl
IGhhcmR3YXJlIHRlYW0uIFNpbmNlIGEgbm9uLXJlY29tbWVuZGVkIHZhbHVlIHdhcyBiZWluZyB1
c2VkLCB0aGF0IGl0c2VsZiBpcyB0aGUgcm9vdCBjYXVzZS4gSSB3aWxsIGFkZCB0aGlzIHRvIGNv
bW1pdCBtZXNzYWdlLjxicj4NCjwvZGl2Pg0KPGRpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBpZD0iU2lnbmF0dXJl
Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQotLTwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KPGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWws
IEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+DQpUaGFua3MgJmFtcDsgUmVnYXJkcyw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkF1cmFiaW5kbyBQaWxsYWk8YnI+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8
aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4N
CjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBz
YW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9t
OjwvYj4gUiwgQmluZHUgJmx0O0JpbmR1LlJAYW1kLmNvbSZndDs8YnI+DQo8Yj5TZW50OjwvYj4g
VGh1cnNkYXksIEFwcmlsIDgsIDIwMjEgMTE6NTUgQU08YnI+DQo8Yj5Ubzo8L2I+IFBpbGxhaSwg
QXVyYWJpbmRvICZsdDtBdXJhYmluZG8uUGlsbGFpQGFtZC5jb20mZ3Q7OyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyAmbHQ7YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PGJy
Pg0KPGI+Q2M6PC9iPiBBYmVyYmFjaywgSm9zaHVhICZsdDtKb3NodWEuQWJlcmJhY2tAYW1kLmNv
bSZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtQQVRDSF0gZHJtL2FtZC9kaXNwbGF5OiBV
cGRhdGUgRENOMzAyIFNSIEV4aXQgTGF0ZW5jeTwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8
L2Rpdj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9ImRpc3BsYXk6bm9uZSI+DQo8IS0t
DQpwDQoJe21hcmdpbi10b3A6MDsNCgltYXJnaW4tYm90dG9tOjB9DQotLT4NCjwvc3R5bGU+DQo8
ZGl2IGRpcj0ibHRyIj4NCjxwIGFsaWduPSJMZWZ0IiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7
IGZvbnQtc2l6ZToxMXB0OyBjb2xvcjojMDA3OEQ3OyBtYXJnaW46NXB0Ij4NCltBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV08YnI+DQo8L3A+DQo8YnI+
DQo8ZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPuKAi0hpIEpheSw8L3Nw
YW4+PC9kaXY+DQo8ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdCI+Jm5ic3A7Jm5ic3A7
IENvdWxkIHlvdSBwbGVhc2UgYWRkIGZldyBkZXRhaWxzIG9uIHRoZSByb290IGNhdXNlLCBpbiB0
aGUgW1doeS9Ib3ddIHNlY3Rpb24/PC9zcGFuPjwvZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExcHQiPjxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0Ij5UaGFua3MsPC9zcGFuPjwvZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExcHQiPkJpbmR1IDxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXYgaWQ9InhfYXBwZW5kb25z
ZW5kIj48L2Rpdj4NCjxociB0YWJpbmRleD0iLTEiIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9j
azsgd2lkdGg6OTglIj4NCjxkaXYgaWQ9InhfZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250
IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIGNvbG9yPSIjMDAwMDAwIiBzdHlsZT0iZm9udC1z
aXplOjExcHQiPjxiPkZyb206PC9iPiBBdXJhYmluZG8gUGlsbGFpICZsdDthdXJhYmluZG8ucGls
bGFpQGFtZC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IFRodXJzZGF5LCBBcHJpbCA4LCAyMDIx
IDExOjQ4IEFNPGJyPg0KPGI+VG86PC9iPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAm
bHQ7YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBQaWxs
YWksIEF1cmFiaW5kbyAmbHQ7QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tJmd0OzsgUiwgQmluZHUg
Jmx0O0JpbmR1LlJAYW1kLmNvbSZndDs7IEFiZXJiYWNrLCBKb3NodWEgJmx0O0pvc2h1YS5BYmVy
YmFja0BhbWQuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbUEFUQ0hdIGRybS9hbWQvZGlz
cGxheTogVXBkYXRlIERDTjMwMiBTUiBFeGl0IExhdGVuY3k8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwv
ZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJ4X0JvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXYgY2xhc3M9InhfUGxhaW5UZXh0Ij5G
cm9tOiBKb3NodWEgQWJlcmJhY2sgJmx0O2pvc2h1YS5hYmVyYmFja0BhbWQuY29tJmd0Ozxicj4N
Cjxicj4NCltXaHldPGJyPg0KVXBkYXRlIFNSIEV4aXQgTGF0ZW5jeSB0byBmaXggc2NyZWVuIGZs
aWNrZXJpbmcgY2F1c2VkIGR1ZSB0byBPVEc8YnI+DQp1bmRlcmZsb3c8YnI+DQo8YnI+DQpTaWdu
ZWQtb2ZmLWJ5OiBKb3NodWEgQWJlcmJhY2sgJmx0O2pvc2h1YS5hYmVyYmFja0BhbWQuY29tJmd0
Ozxicj4NCkFja2VkLWJ5OiBBdXJhYmluZG8gUGlsbGFpICZsdDthdXJhYmluZG8ucGlsbGFpQGFt
ZC5jb20mZ3Q7PGJyPg0KLS0tPGJyPg0KJm5ic3A7ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjMwMi9kY24zMDJfcmVzb3VyY2UuYyB8IDIgKy08YnI+DQombmJzcDsxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwMi9kY24zMDJfcmVzb3VyY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDIvZGNuMzAyX3Jlc291cmNl
LmM8YnI+DQppbmRleCBhOTI4YzFkOWE1NTcuLmZjMmRlYTI0M2QxYiAxMDA2NDQ8YnI+DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzAyL2RjbjMwMl9yZXNvdXJjZS5j
PGJyPg0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwMi9kY24zMDJf
cmVzb3VyY2UuYzxicj4NCkBAIC0xNjQsNyArMTY0LDcgQEAgc3RydWN0IF92Y3NfZHBpX3NvY19i
b3VuZGluZ19ib3hfc3QgZGNuM18wMl9zb2MgPSB7PGJyPg0KJm5ic3A7PGJyPg0KJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC5taW5fZGNmY2xrID0gNTAwLjAsIC8qIFRP
RE86IHNldCB0aGlzIHRvIGFjdHVhbCBtaW4gRENGQ0xLICovPGJyPg0KJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC5udW1fc3RhdGVzID0gMSw8YnI+DQotJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IC5zcl9leGl0X3RpbWVfdXMgPSAxMiw8YnI+DQorJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IC5zcl9leGl0X3RpbWVfdXMgPSAxNS41LDxicj4NCiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAuc3JfZW50ZXJfcGx1c19leGl0X3RpbWVf
dXMgPSAyMCw8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLnVy
Z2VudF9sYXRlbmN5X3VzID0gNC4wLDxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAudXJnZW50X2xhdGVuY3lfcGl4ZWxfZGF0YV9vbmx5X3VzID0gNC4wLDxicj4N
Ci0tIDxicj4NCjIuMzEuMTxicj4NCjxicj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_CH0PR12MB5284FD042B80627C641F56D18B749CH0PR12MB5284namp_--

--===============1076559108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1076559108==--
