Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DDC34522C
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Mar 2021 23:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C79A6E5D4;
	Mon, 22 Mar 2021 22:00:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097C36E5D4
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 22:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnyviDvNs0+R9/gPzmsqGucyn6C3/wLXO8nDW+mhMioFtPuWv16FrDagHN32dlo/UusM9OO4FEKQkelp2j1DCNJR8p9H1/dOakhW9BRyzJFPyQHNA/eLLAeU+eU3PJ/tHXDEfIMtGmBJVOL4gvhXVk17vaeHSzpBtZYWD5C4wXMsIC0zv+tDSpl+ZvhsxVmFrHO1IZyjPDv3kjZw8iTpi2UCz2UU/fCqScXeKS7SXWHewoveKxHxI+AIXRnRoB/Ckvg2gGAql1MEmMXYuru+msf0e+V2SOws68+rXcZK4tmKKt7kCD8QIEDAP4JK9VUo/SypXU1wyQEfGYIgb3TkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bwFGxyMOivWz8twbMhpIA3Kw85Y+V+aSOpyeji7xcY=;
 b=No6jl7OqMMBSdM/MD2EqaZNxC/wpcLRaVnA6BXqHKD51I+QpgKxzcgnpYfgqOuERPXx/Pxnwv4ZqtB49A9bwV6YfMdlSTrahVr2c6GVdu7X86yXH8KDoM5pt90GkXKqEBh/zMq/pAbQ33vZVwKMfYmaON+Rqc+NyciJ9VZEQspaqFl4m95A/HbQa1zQMtPBrfjXmhZdEgo+RW8gBk8Wk4XQkgYHCzLN1i7vK8m2kZtHSOMdljvrNmOKW1XE/64z6c7+BiclU2reResyW08mMxtpPAdBBWx634hqTDgAL+fAaJTdIqRuS/LPArfafTcXzagah/RfQrhhKnKrXv4Oelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bwFGxyMOivWz8twbMhpIA3Kw85Y+V+aSOpyeji7xcY=;
 b=2qyKODu9jvmVux2WJjvhwSrg5ljLYClI6hVqRwRnyNLefLB318Rh+C4y2ylXxEAzEbFj2y327yt59COzZVdJMQgTNTP8udTpIHW8EVUiXwJD2+bqA1npASwCXHv2pHocp/gRjRo1LKcnMeC8Ilhdkt5PmCRbhJWXaTBA+snflKo=
Received: from DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16)
 by DM5PR12MB1883.namprd12.prod.outlook.com (2603:10b6:3:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 22:00:08 +0000
Received: from DM6PR12MB4267.namprd12.prod.outlook.com
 ([fe80::3017:8af0:cb60:485a]) by DM6PR12MB4267.namprd12.prod.outlook.com
 ([fe80::3017:8af0:cb60:485a%8]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 22:00:08 +0000
From: "R, Bindu" <Bindu.R@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Allow idle optimization based on vblank.
Thread-Topic: [PATCH] drm/amd/display: Allow idle optimization based on vblank.
Thread-Index: AQHXGr8h9juTNKU0QUGYcEdatosS4KqIDjKAgABa8oCAAg71L4AAqGqAgADpRHmAA71IgIAAydNJ
Date: Mon, 22 Mar 2021 22:00:08 +0000
Message-ID: <DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659@DM6PR12MB4267.namprd12.prod.outlook.com>
References: <20210316234952.254296-1-bindu.r@amd.com>
 <2a8218f2-9df9-d5c3-3a88-7e930a8c8524@daenzer.net>
 <MW3PR12MB4554B23D18EFB926B9EAFF05F96A9@MW3PR12MB4554.namprd12.prod.outlook.com>
 <DM6PR12MB42677FABD0BB51F870CD9DF4F5689@DM6PR12MB4267.namprd12.prod.outlook.com>
 <d28b97df-8bc8-88cb-68aa-d0bd7adc611c@daenzer.net>
 <DM6PR12MB4267121B24149811AB3658FFF5679@DM6PR12MB4267.namprd12.prod.outlook.com>,
 <e72e6a66-8a88-5bc3-a983-a4cb93a804cb@daenzer.net>
In-Reply-To: <e72e6a66-8a88-5bc3-a983-a4cb93a804cb@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-22T22:00:07.590Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:4ce1:13a0:ccec:9f35:bea3:276e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 160bf9a2-c9e5-4128-586f-08d8ed7ddba2
x-ms-traffictypediagnostic: DM5PR12MB1883:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB188375F2F818E77B7CE75C77F5659@DM5PR12MB1883.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O8k9i2xgZQVF5zgPZiO1DolJDz99+Sou8njQYrsH8GTGEXPd6EWPiFwXsUeEvfk9XIUkOYmKHRuKNjoTNdeWpo37VKgQIUe2TwiEpcD0OOghF1aBerj0ffUXwVrPJbKASq9mVn9cIEn3XXwj/laNvp9BsvITqk/AJN0+uA32ymBHflBIlWDu0aZWMUvUYOGrbbuO0jl0M2ynjLc/q+cpUw8tYcvb0LsY1RQqyf7nvAIGkOiYnfUtfm2RGD4I5k0Dg7GDpOBCz+b3+dmMBGdpk8VDk8tnmteEgy+pqAnN0P8+hVMynUBwbthIpYRD5u1hhB9ZJN6v4WXrfEMHTJtstoWN/9D1gIYZvBsNC7zMgnkO3dzSE+lRRe5l84GmZIuOYSvsO/vn0qoe351RwSW9YCzSS2SsUKCWZHZQ8IwH/QOVezNREruNpbhgBWiHicWzEL345FiFLVWJRlPo+JvmHCm7UI/UNQfU1I82tZJs3hH8j1VBNPhGf9A1n1seLOQumTy1Um7o8OwBTw+fu2GIKQVidYqHVogezxcyIy9jU6fMkZB8FXAaVGxhbxFy5nSH/NX/1j6Tp5wtYgW/21LMocyHlSOynANQx2iKyY2Y4Qe33RDka3DgBq5kZtHMOPSQqv4Gby2PDn6jU6ghaSW3R4p0S2ggAduFfCAdXm0Sn64v4qNpUJNz3kJSVqxxLqGxp4o6Ha4yO5uv4VB7TGU0Z9N8lMXZCc+N1ip5eUKat8nZ1E5f1RyYFw1ZiX5xpE2u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4267.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(99936003)(52536014)(86362001)(316002)(19627405001)(8676002)(966005)(71200400001)(2906002)(38100700001)(45080400002)(53546011)(76116006)(4326008)(5660300002)(7696005)(83380400001)(66574015)(6506007)(33656002)(186003)(478600001)(55016002)(54906003)(91956017)(8936002)(9686003)(166002)(110136005)(66476007)(66556008)(66946007)(66446008)(66616009)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WWJ4a2Vjbmw1R202b0MrM0J3cHFmZkJnejJEQTNQenRLcWxXMkFjK01yRUNQ?=
 =?utf-8?B?c1RoNnd6YS83WjNiSWlUQnM2UkFkeU01d1BnRk45NWFFYUlhcVhrc05mbTh2?=
 =?utf-8?B?K29Tald5MUlRZkIwbldLZU8xZ21OeXh3MVpuMU9mVXlwaWtXT2IzaXRXRUFB?=
 =?utf-8?B?RG1SZ0FFRFlzRXBKRk03Yk5UY2FaSkd0WlJ5YXhjTmczbXl0TlZTYWJIdnc4?=
 =?utf-8?B?dHNSdzBUQUk0d3M2MjZpWnVIb3ZLUE1kcUtLbUE4aTVCRzRzM3JjRHlEaW01?=
 =?utf-8?B?eTQ3VldCL1dwV2JwY1VHLzQvb2dqOUpIcTlsTmpGbW9HQ0dMTnp0MWZ6d1lK?=
 =?utf-8?B?aE5NQWdMQlgrVHdUT2hySzhhRVVTRXFDK1VEcndEa25HNEFnUDMyZDlpalQy?=
 =?utf-8?B?bmFzRmpJa0ltSGZZemFlTFdNUHlIVGNoTzF4UVQ2SWpRaUVUYlJEc0pvdk5i?=
 =?utf-8?B?dXhiM05WKzVvakdlT1N4TUlVOW5GV1hTSVYzOHEzQ3dxZzJEL1d3QmtTQWN5?=
 =?utf-8?B?aWNQbnRaa3pZWTBwNjBObTRWbmhuNjdsRWVRQjZjVFRPdTBlQmNNcXFraStj?=
 =?utf-8?B?MjM4Z1B1SGREaXMvMENHY1EwVEIycitmVnVhUHc5alU0aXVNVWdCdFVxNVpU?=
 =?utf-8?B?V3E3UnNiUlVlbXBrdWJEc0lsSDZrOFNCOUh0cG9MRGlkWHdOZGorTTZRVnNx?=
 =?utf-8?B?MXJrRjM2YUI0UWdSM1RHamlxWGgzUzRLNDNCdndQREo2MXU1ZTRmclQvMzBS?=
 =?utf-8?B?Ym1wK2xDYWdYOVErWStVVWxWbTZHMW91VjRaWDl5dVhWbjdqTlR2d3M0RkZ3?=
 =?utf-8?B?aTBBa1UxZjhDMTVrQ09Md0JubDVRejFDcDNEaTRYalVFdXkvV0hVclRtYnlQ?=
 =?utf-8?B?eC9CUU1oZ0E4WnpORkd3czJDRVBtSk5FQ2l4UkZaSnlNZ0dQdjc4VEVuTFcr?=
 =?utf-8?B?enFzYk9GSFhQTm5vN2lrZmhLTW5iNzhoSUlVOEp3MlYvQXRCR2N0eEsxM2VW?=
 =?utf-8?B?L2RsUmVzNER1djh6M1I0eGdNaUNBV2Q0a1dpVW5JNGROSmNqNFZvNkovZ1U3?=
 =?utf-8?B?YklNd2k4L2JNRzEzSk1xejE1WEFCSkJMa0dCVExlRWE4ZWlINFMwMW1JYld4?=
 =?utf-8?B?NVRIRDJ5eDlUVEFYQXUvZmtQU1ZZcVA2dmpWaHBYckdwUmJsNlZMb01KbnpH?=
 =?utf-8?B?U1FsQ1pRMno1WmRzcjJFUWZmYmI5V1FZTGgvdVc1NENVejhyeXNZbzJWVW5t?=
 =?utf-8?B?N0xFNU4wSnFvZnJ4VGdNbEhLb2xBcWNscGg4NzF1azNPbWtxQ1ZBR0pxVVBH?=
 =?utf-8?B?cmJvRDV4bXM4UnNUd0ZmaExBU1ZiRFpLdS80NEpGemdQQzBtOUdFUWM3cW1L?=
 =?utf-8?B?UjEzSDI3N1pEcHZWUG82aDF1cTRiMnZkbUdHaWdGcjhBNThVMEIzcG9haGps?=
 =?utf-8?B?TjV3T250VHYxemxNaGxTRUJwZ2lVRk5CanhWTzVIaFNyaTJaMEl5R2N0akZ3?=
 =?utf-8?B?VUpxY1RqUVltdUZhMFltVVB3MU1PT0RZbWF6V1FFcmhrV2taVlk4K1gwZ01u?=
 =?utf-8?B?eEZGeTVpSU5rUXBSTTVjWWVZSHh5b3NncmcrYWl6RHZ5QTI5WXBjdTJMaWpU?=
 =?utf-8?B?WDVtQzNtU2tjd1Vtb3c3L0RoWFZ0QjJ5aGd3bVpybHVTK0VFSkFxZGxMVjVI?=
 =?utf-8?B?QmFSbnU5MWJlTnlFNUpCUlJkTDB0UmVzQ05waEdpYlg2YlJBZ0V3eHJobEE3?=
 =?utf-8?B?T2t2T0UvS1RtejE4VzVRRzVkUFo2ZURHRDhJMG41eG5RNXk1d1NVeG1PRDlp?=
 =?utf-8?B?cjJ2aitIbXFHVElSa0c3VHFFZGxxSVVjVEdvaGx6eTNBN0NBR2g3dVNXVVVD?=
 =?utf-8?Q?uAfJi5HggECOm?=
Content-Type: multipart/mixed;
 boundary="_004_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4267.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160bf9a2-c9e5-4128-586f-08d8ed7ddba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 22:00:08.3155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMtYSXbP1HmrkLD8fw8ljBmdgJHBscLV9HzdM7hsUOTlu1qZ6Qk/WS3M59CRYlOHtoC0hiHtc0eQZd2xDcjzbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_"

--_000_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQri
gItIaSwNCiAgICBUaGUgdXBkYXRlZCBwYXRjaCBoYXMgYmVlbiBtZXJnZWQgYW5kIGlzIGF2YWls
YWJsZSB3aXRoIGNvbW1pdCBJRCAiZWY1YzU5NDQ2MTY1MGRlMGExOGFhMGJmZDI0MDE4OTk5MTc5
MGQ3ZSIuDQpTb21laG93IG1pc3NlZCB0byBtYWlsIHRoZSB1cGRhdGVkIHZlcnNpb24sIGF0dGFj
aGVkIGlzIHRoZSB1cGRhdGVkIHBhdGNoLCBwbGVhc2UgcmV2aWV3IGFuZCBsZXQgbWUga25vdyBp
ZiBhbnkgY2hhbmdlcyByZXF1aXJlZC4NCg0KVGhhbmtzLA0KQmluZHUNCg0KIOKAiw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxA
ZGFlbnplci5uZXQ+DQpTZW50OiBNb25kYXksIE1hcmNoIDIyLCAyMDIxIDU6MzIgQU0NClRvOiBS
LCBCaW5kdSA8QmluZHUuUkBhbWQuY29tPjsgTGFraGEsIEJoYXdhbnByZWV0IDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgRmVuZywg
S2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1kL2Rpc3BsYXk6IEFsbG93IGlkbGUgb3B0aW1pemF0aW9uIGJhc2VkIG9uIHZibGFuay4NCg0K
T24gMjAyMS0wMy0yMCAxOjMxIGEubS4sIFIsIEJpbmR1IHdyb3RlOg0KPg0KPiBUaGUgVXBkYXRl
IHBhdGNoIGhhcyBiZWVuIHN1Ym1pdHRlZC4NCg0KU3VibWl0dGVkIHdoZXJlPyBTdGlsbCBjYW4n
dCBzZWUgaXQuDQoNCg0KLS0NCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZyZWRoYXQuY29tJTJGJmFtcDtkYXRhPTA0JTdDMDEl
N0NCaW5kdS5SJTQwYW1kLmNvbSU3QzVlY2JmNjViNjBlYzQ5MWZiYzQ0MDhkOGVkMTU2YjEwJTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzUyMDAyMzU0MDc5
ODI5MSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MwJmFtcDtzZGF0YT1WY29K
UkN4VEFUVnM4SlpaVSUyRnpjWXhNMXlmRkZxMVo4cGVycnRWVTFQS0UlM0QmYW1wO3Jlc2VydmVk
PTANCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBN
ZXNhIGFuZCBYIGRldmVsb3Blcg0K

--_000_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_
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
MCwgMCwgMCk7Ij4NCjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDExcHQ7Ij7igItIaSw8L3NwYW4+
PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8
c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMXB0OyI+Jm5ic3A7ICZuYnNwOyBUaGUgdXBkYXRlZCBw
YXRjaCBoYXMgYmVlbiBtZXJnZWQgYW5kIGlzIGF2YWlsYWJsZSB3aXRoIGNvbW1pdCBJRCAmcXVv
dDtlZjVjNTk0NDYxNjUwZGUwYTE4YWEwYmZkMjQwMTg5OTkxNzkwZDdlJnF1b3Q7Ljxicj4NCjwv
c3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NCjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDExcHQ7Ij48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExcHQiPlNvbWVob3cgbWlzc2VkIHRvIG1haWwgdGhlIHVwZGF0ZWQgdmVyc2lvbiwNCjwvc3Bh
bj5hdHRhY2hlZCBpcyB0aGUgdXBkYXRlZCBwYXRjaCwgcGxlYXNlIHJldmlldyBhbmQgbGV0IG1l
IGtub3cgaWYgYW55IGNoYW5nZXMgcmVxdWlyZWQuICZuYnNwOw0KPGJyPg0KPC9zcGFuPjwvZGl2
Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsiPjxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxzcGFuIHN0eWxlPSJmb250LXNp
emU6IDExcHQ7Ij5UaGFua3MsPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsiPkJp
bmR1IDxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJp
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4NCjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDExcHQ7Ij48L3NwYW4+PGJy
Pg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQombmJzcDs8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMXB0OyI+4oCLPC9zcGFuPjxicj4NCjwv
ZGl2Pg0KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTpp
bmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPg0KPGRpdiBpZD0iZGl2UnBseUZ3
ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJm
b250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBNaWNoZWwgRMOkbnpl
ciAmbHQ7bWljaGVsQGRhZW56ZXIubmV0Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBNb25kYXksIE1h
cmNoIDIyLCAyMDIxIDU6MzIgQU08YnI+DQo8Yj5Ubzo8L2I+IFIsIEJpbmR1ICZsdDtCaW5kdS5S
QGFtZC5jb20mZ3Q7OyBMYWtoYSwgQmhhd2FucHJlZXQgJmx0O0JoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20mZ3Q7OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAmbHQ7YW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBEZXVjaGVyLCBBbGV4YW5kZXIg
Jmx0O0FsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20mZ3Q7OyBaaG91MSwgVGFvICZsdDtUYW8uWmhv
dTFAYW1kLmNvbSZndDs7IEZlbmcsIEtlbm5ldGggJmx0O0tlbm5ldGguRmVuZ0BhbWQuY29tJmd0
Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IEFsbG93
IGlkbGUgb3B0aW1pemF0aW9uIGJhc2VkIG9uIHZibGFuay48L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwv
ZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5PbiAy
MDIxLTAzLTIwIDE6MzEgYS5tLiwgUiwgQmluZHUgd3JvdGU6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IFRoZSBVcGRhdGUgcGF0Y2ggaGFzIGJlZW4gc3VibWl0dGVkLjxicj4NCjxicj4NClN1Ym1pdHRl
ZCB3aGVyZT8gU3RpbGwgY2FuJ3Qgc2VlIGl0Ljxicj4NCjxicj4NCjxicj4NCi0tIDxicj4NCkVh
cnRobGluZyBNaWNoZWwgRMOkbnplciZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxhIGhyZWY9Imh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnJlZGhhdC5jb20lMkYmYW1w
O2FtcDtkYXRhPTA0JTdDMDElN0NCaW5kdS5SJTQwYW1kLmNvbSU3QzVlY2JmNjViNjBlYzQ5MWZi
YzQ0MDhkOGVkMTU2YjEwJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzUyMDAyMzU0MDc5ODI5MSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MwJmFtcDthbXA7c2RhdGE9VmNvSlJDeFRBVFZzOEpaWlUlMkZ6Y1l4TTF5ZkZGcTFaOHBlcnJ0
VlUxUEtFJTNEJmFtcDthbXA7cmVzZXJ2ZWQ9MCI+DQpodHRwczovL25hbTExLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZyZWRoYXQuY29tJTJGJmFt
cDthbXA7ZGF0YT0wNCU3QzAxJTdDQmluZHUuUiU0MGFtZC5jb20lN0M1ZWNiZjY1YjYwZWM0OTFm
YmM0NDA4ZDhlZDE1NmIxMCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc1MjAwMjM1NDA3OTgyOTElN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMCZhbXA7YW1wO3NkYXRhPVZjb0pSQ3hUQVRWczhKWlpVJTJGemNZeE0xeWZGRnExWjhwZXJy
dFZVMVBLRSUzRCZhbXA7YW1wO3Jlc2VydmVkPTA8L2E+PGJyPg0KTGlicmUgc29mdHdhcmUgZW50
aHVzaWFzdCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IE1lc2EgYW5kIFggZGV2ZWxv
cGVyPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8
L2h0bWw+DQo=

--_000_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_--

--_004_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_
Content-Type: text/x-patch;
	name="0001-drm-amd-display-Allow-idle-optimization-based-on-vbl.patch"
Content-Description:  0001-drm-amd-display-Allow-idle-optimization-based-on-vbl.patch
Content-Disposition: attachment;
	filename="0001-drm-amd-display-Allow-idle-optimization-based-on-vbl.patch";
	size=1791; creation-date="Mon, 22 Mar 2021 21:39:48 GMT";
	modification-date="Mon, 22 Mar 2021 21:39:50 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlZjVjNTk0NDYxNjUwZGUwYTE4YWEwYmZkMjQwMTg5OTkxNzkwZDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCaW5kdSBSYW1hbXVydGh5IDxiaW5kdS5yQGFtZC5jb20+CkRh
dGU6IFR1ZSwgMTYgTWFyIDIwMjEgMTc6MDg6NDcgLTA0MDAKU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kL2Rpc3BsYXk6IEFsbG93IGlkbGUgb3B0aW1pemF0aW9uIGJhc2VkIG9uIHZibGFuay4KCltX
aHldCmlkbGUgb3B0aW1pemF0aW9uIHdhcyBiZWluZyBkaXNhYmxlZCBhZnRlciBjb21taXQuCgpb
SG93XQpjaGVjayB2YmxhbmsgY291bnQgZm9yIGRpc3BsYXkgb2ZmIGFuZCBlbmFibGUgaWRsZSBv
cHRpbWl6YXRpb24gYmFzZWQgb24gdGhpcyBjb3VudC4KQWxzbyxjaGVjayBhZGRlZCB0byBlbnN1
cmUgdmJsYW5rIGNvdW50IGRvZXMgbm90IGRlY3JlbWVudCwgd2hlbiBjb3VudCByZWFjaGVzIDAu
CgpTaWduZWQtb2ZmLWJ5OiBCaW5kdSBSYW1hbXVydGh5IDxiaW5kdS5yQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDkgKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IDZlN2EzMzNhYmJlMC4uZjQ1NWZjM2FhNTYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTk4Nyw3ICs5ODcsNyBA
QCBzdGF0aWMgdm9pZCBldmVudF9tYWxsX3N0dXR0ZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3Jr
KQogCiAJaWYgKHZibGFua193b3JrLT5lbmFibGUpCiAJCWRtLT5hY3RpdmVfdmJsYW5rX2lycV9j
b3VudCsrOwotCWVsc2UKKwllbHNlIGlmKGRtLT5hY3RpdmVfdmJsYW5rX2lycV9jb3VudCkKIAkJ
ZG0tPmFjdGl2ZV92YmxhbmtfaXJxX2NvdW50LS07CiAKIAlkY19hbGxvd19pZGxlX29wdGltaXph
dGlvbnMoCkBAIC04NzA1LDkgKzg3MDUsMTQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2F0b21p
Y19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiAJCWRtX2VuYWJs
ZV9wZXJfZnJhbWVfY3J0Y19tYXN0ZXJfc3luYyhkY19zdGF0ZSk7CiAJCW11dGV4X2xvY2soJmRt
LT5kY19sb2NrKTsKIAkJV0FSTl9PTighZGNfY29tbWl0X3N0YXRlKGRtLT5kYywgZGNfc3RhdGUp
KTsKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTikKKyAgICAgICAgICAgICAgIC8q
IEFsbG93IGlkbGUgb3B0aW1pemF0aW9uIHdoZW4gdmJsYW5rIGNvdW50IGlzIDAgZm9yIGRpc3Bs
YXkgb2ZmICovCisgICAgICAgICAgICAgICBpZiAoZG0tPmFjdGl2ZV92YmxhbmtfaXJxX2NvdW50
ID09IDApCisgICAgICAgICAgICAgICAgICAgZGNfYWxsb3dfaWRsZV9vcHRpbWl6YXRpb25zKGRt
LT5kYyx0cnVlKTsKKyNlbmRpZgogCQltdXRleF91bmxvY2soJmRtLT5kY19sb2NrKTsKIAl9Ci0K
KwkJCSAgIAogCWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBuZXdfY3J0
Y19zdGF0ZSwgaSkgewogCQlzdHJ1Y3QgYW1kZ3B1X2NydGMgKmFjcnRjID0gdG9fYW1kZ3B1X2Ny
dGMoY3J0Yyk7CiAKLS0gCjIuMjUuMQoK

--_004_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_004_DM6PR12MB4267C0B8AE4E763B4AC3CA8AF5659DM6PR12MB4267namp_--
