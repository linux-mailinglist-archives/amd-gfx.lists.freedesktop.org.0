Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B9360343
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Apr 2021 09:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2047B6E9EE;
	Thu, 15 Apr 2021 07:25:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596E6E9EE
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Apr 2021 07:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1Jxd0B+sWsnUgvS3whFNg1INjkFlRPTO2QXHeX8lvxaVDieQljqOCnRFWCiqbyD9KiU9PYmh0tPaENqxeAz/cZqJ8UhOToXnUooZLNezWqZ0dtTGSC3JRI/9iGphfqvvTEM7lMQVocUH9C/QfBgC4FZHjopi8oFwF81MbNFI6X2rSrQkzfnNmO922FikjNaKt2r6PvEZ0hoNbRVdD6mrbzDulHMtRJlZdhgV5+cZJMsC5hQ+xerQf4/AVs2rTuNZch8m3Lqj652W6Gx5ub6p37AKoVPzEUYRPQ99FIhqAj2niYxRHRtN4VWyvVUfeUSrrbJx5hJX/8EKgx3tBRegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+NolUMoj6cu9rP8u0Eo0CBMYshHS55vI+OxXnxufx4=;
 b=j9CwaXs4bJfGkqf3Pcu0lQUK1khsgtIwj6C0rjzp8ARfvKkytF3WMSEBGIZuC61Z/IkjOnePH4TRSbU5StZbteQPcaIaCijrp1Cui74hybwUKJYIz7bzXNGBlVQZ5yaUGsREooisB1sR+d60VTN5lfZdfhjh5FxibvhPKZdukkQlb1ZjKseXJyabLmdD7rLiA1NLeROhfLdfcZenOO4a7Px2VJQiUJs0HuecwSnmfmgcXHHQbcSeh89/uJx7ZvBzsrgTiiCdA308noUbyAnMlGjGEU77UfhzCMHVBh6GCZb3Dhvrzytyyt+7dzJ+HoK2KAPSMbf69pkMUPrOkHNr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+NolUMoj6cu9rP8u0Eo0CBMYshHS55vI+OxXnxufx4=;
 b=aIkLJKoLxe/xopewlD72+8Tw+LdhK8Enz+PThJrl80rx4WirL0b22pfSQxaGzu+Mo9Ar7tHNFDa5kaoZu1uCfXn/1UWj5c+CvS5pDEWL31jEzN0ITbIdytSntV+Q53QqqGuvnLF17cZ0blT0cjvsuPaAlhhe1hNwPNsWRZZ6Ukg=
Received: from DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23)
 by DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 07:25:38 +0000
Received: from DM6PR12MB4371.namprd12.prod.outlook.com
 ([fe80::3928:717f:6399:75bc]) by DM6PR12MB4371.namprd12.prod.outlook.com
 ([fe80::3928:717f:6399:75bc%2]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 07:25:38 +0000
From: "Zhou, Peng Ju" <PengJu.Zhou@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/8] drm/amdgpu: change MMHUB register access from MMIO to
 RLCG
Thread-Topic: [PATCH 1/8] drm/amdgpu: change MMHUB register access from MMIO
 to RLCG
Thread-Index: AQHXLGENPpbOoYibIEODf/XxvNaoPaqqtmiAgADSyRCACathUA==
Date: Thu, 15 Apr 2021 07:25:38 +0000
Message-ID: <DM6PR12MB4371D57D363B2E70042D62F2F84D9@DM6PR12MB4371.namprd12.prod.outlook.com>
References: <20210408102205.911-1-PengJu.Zhou@amd.com>
 <074f9425-799e-e60c-0022-08743f18c229@amd.com>
 <DM6PR12MB4371E4C410C5940878820261F8739@DM6PR12MB4371.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4371E4C410C5940878820261F8739@DM6PR12MB4371.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-15T07:25:23Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=7711d623-024c-461b-b7ed-29873bd93311;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: drm-next upstream
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2129c0fb-c99c-4de9-3468-08d8ffdfab0f
x-ms-traffictypediagnostic: DM6PR12MB3755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB375595C6C8D6D64F2C27F1D5F84D9@DM6PR12MB3755.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GB6C7LHix1Q03Dy9bI73r9EYbDulVIWPcHy/cjez8XgNfhOXdMv/NvYLAXWlw+u3CIK4dmM5D0H9XvOzxXn6qVAMMJs0D3l3lcW9OKbZc7t60ce2QvHKIuNMGyt2/TXzi8/cxEPTlpydniYeIw/GS3VyLtyt+Yy53XS60hgfCvyzvYKTBQWUfKX5FgBPc6W+ecf7E3QZapxEKKVvYjIYkKSWqiavB/+CX7ykMe4LmjxFcGwvip9ZGNzXfefNS5DKtvK8MtZ6VwCEovJ43CHa30uBVpFHa5syWMLJxz+ciE1CjSkKTuwLO0tWhYiKXYnqWi3YX/BbK4/qGRYTG/67QLzyqJEjIsyQFogiJyS0pvVCxDLUQqnS1SmE5VHo76gshhVH10gFC0E0TY4Rh4ad4EGCJFRkDUtq12boIoAWoDBUOm23S5EuPOIy68bVemLMyWxUdqIF/9k1SImtPPc5X7AA4L6ySexm6ge9mix+oC4b3coulXC9I3rXNykiDntgpGgQ6U0KirYaMV7sIdif04WFeKHD3aOcMs301FaGRS/WGVaCUS0j5wztRBPYgqqxdbqVuLydV5PZP9KK4T86028+xfSa8Zifv2NKDzjtYAo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4371.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(186003)(26005)(8936002)(53546011)(6506007)(19627235002)(316002)(83380400001)(110136005)(76116006)(9686003)(33656002)(66476007)(64756008)(66556008)(71200400001)(66446008)(5660300002)(52536014)(66946007)(86362001)(55016002)(122000001)(478600001)(7696005)(2906002)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Ylh0aHh5WDRRWDE0N0tFK29tK1NnY0JRdnBoRzVza1NiVm5kT0FPM1ZiRHN3?=
 =?utf-8?B?SWY1UFFCY2ZIMlNqT2RyaEJYRmNYVXhJeHpXSWxkL0N6NERZRVA4K1l0VmNI?=
 =?utf-8?B?OTVtUmR2ZnprdjBBNFA1QlRMa0hEYWtYYm5qeU1qaGZHUmt6WGFzQklWWTlr?=
 =?utf-8?B?Z2ZtU25md3EzZVdZUk9McVNLYlVaWjR0VXg4ZUMwNWtocTBSdWdoN29Ca2dj?=
 =?utf-8?B?TjFMeS80emo4TGFETnBTRzNZN0RRcUtHTkFTUGR5ZFpISnIxLzAzZ2kxT1Y1?=
 =?utf-8?B?aHpyWVYzWnZpcUJXUWRUVVpESStOZ1MxNjk1TkdLYVJOeS9mckd5VmxzRTNX?=
 =?utf-8?B?YTIrVEFhMHViWTVENEkrc0pyWGpBNUtpNVBtN0FPNW5pakRUQjhRSjZJZW5V?=
 =?utf-8?B?dGhTWm5VY0xXMFNVVzl3bHBCL3VoYkZRZ1E4VllFYXM2YUI4cXc2c25MejlQ?=
 =?utf-8?B?T2E4ZzlOMHBhamQyME9QNk5vZHo5L1lVaVZiOE0xZ3ZreWROcEJJVGpJR1ZU?=
 =?utf-8?B?SWhrRDhyYWx3UVBhQ3hwNDVqRHFCUGNISjJJZ1U4MUgwZ3RQRE5BQ2hIaC84?=
 =?utf-8?B?eGFKdHY1eFFNWlVxYTJTNzFsRTg3eHF0b01mblJ3OGNmT1JYa3lmQk1MckZt?=
 =?utf-8?B?R2dzNUVHTkQwWDVZYThtdEVPaVZPYWFsTGdxREtSRmszVnVRVW9WTTJrZStQ?=
 =?utf-8?B?NDl2WUNlWEMwVnZ1UGZ5UUN3OXNwL0dKdisveGd1dHVvQzNwaWNvWW96MHhi?=
 =?utf-8?B?dFk5TzlHUERjQzlScHc4R05QNzA2YkhDcTRsOEdtYVBXdjQxVGErZWZGTC9r?=
 =?utf-8?B?Y2ZpOUM2QzJleDc4MFNpeEhhcXpTMHJEN3M1U280Nmpaa2UxdGpGaXlpeThv?=
 =?utf-8?B?V0ROS1lnWGRGaEZYNGZlam1qSUhvVFV5ZjFGN2dqZnB0dklWV0ZiTXFhWXFP?=
 =?utf-8?B?c1NKbDdXcVBnRy82K2JIZW1zZzU4VDlUSzM2VHo4TTVNakxMdi9pU0F2L2hq?=
 =?utf-8?B?UVgza2ZHOFJLemhGRnpLT1RqcHNmb002Sm9HalRLNkltYm5jMEtKVzJOODJs?=
 =?utf-8?B?bEVHRks1cTlSWXRETktOcVA0dmFhYVNvSEZMTWhQUkFET3lRSVNJVnUyRHlD?=
 =?utf-8?B?M0UyamJkVG9JTmdjOFduQUV1ckJGaGszRHVYVGIyU1hmcWdjejhEUThEbjVn?=
 =?utf-8?B?MGFpU0x5a1B3cUx2LzNyaEloNUE3c0VaMXYvS2ZBNm5GTTJRRUMwV0xKbFkz?=
 =?utf-8?B?R1g4TmJZUlZzZjQ5cDhhUmgwbjVrY3JXdEVsZjk3NlZCbU9SalFmY1Q0Szgw?=
 =?utf-8?B?dnhuRUx5ZEZuTlJvVkNJb2hZNXcyYU8xZjN2eVprNWtDM3dzSnlEM0hwSW11?=
 =?utf-8?B?VG14dkF1VHJMYXRXTHNPd25lbERTb0c1SlN0K0NFcitxQitJSVBDMjRCL2Vr?=
 =?utf-8?B?cXpIcmluQzZRQ2ZoWlUzOXZhQTI4R3hyWWJQS2VYVzFVa3pIdTBIdFNVSUln?=
 =?utf-8?B?bzNEcjNZbWxUM2t5OGE4ZG9rMzcraVM0UVYyVGtzZ3F0czhTczZHNnNzMHZS?=
 =?utf-8?B?MnF1YXplVDZBUWxXaFZkSk1qSU1lRjFoaHZsQnQya2xLZXFoWEhtU2JLN2E4?=
 =?utf-8?B?QUJVWFpnMTdiZVRBdE01MW9WTTd1Z2lQZ3JiN3RHd1FkZU1kUFV2RlVXVDcx?=
 =?utf-8?B?VmFCQ2x1RDRkeW9rUllKM2tBRE4rTXZjS1Nzb2ZTRlRvbmpJK0N0NEZBeXlO?=
 =?utf-8?Q?fHuSLx4fuqIoux7MocGPOHdommuN9AlQqVmuo0K?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2129c0fb-c99c-4de9-3468-08d8ffdfab0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 07:25:38.4042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57H01kNCPBWzZ/ANR2Mc2qplK3fl9FimVT7VSQTGRopLk26HJUsuLKSJ+tvX7ZJu2anco/9j0XENSbt9XKrNPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBGZWxpeA0KVGhhbmtzIGZvciB5b3VyIHByb3Bvc2FsIGFib3V0ICIgR2l2ZW4gdGhlIG51bWJl
ciBvZiBjYWxsLXNpdGVzIGJlaW5nIG1vZGlmaWVkIGluIHRoaXMgcGF0Y2ggc2VyaWVzIg0KV2Ug
ZGlzY3Vzc2VkIGludGVybmFsbHksIGFuZCBoYXZlIGZvbGxvd2luZyBjb25jZXJuOg0KCTEuIGV4
cG9zZSBvdXIgcmFuZ2VzIHRvIG9wZW5zb3VyY2UuDQoJMi4gbG9zdCB0aGUgb3J0aG9nb25hbGl0
eSBpbiBvdXIgc29mdHdhcmUgc3RhY2suDQpTbyB3ZSB3YW50IHRvIGtlZXAgb3VyIG9yaWdpbmFs
IHdvcmthcm91bmQuDQoNCkRvIHlvdSBhZ3JlZT8NCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIA0KQlcNClBl
bmdqdSBaaG91DQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmhvdSwg
UGVuZyBKdSANClNlbnQ6IEZyaWRheSwgQXByaWwgOSwgMjAyMSAxMTozNiBBTQ0KVG86IEt1ZWhs
aW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIIDEvOF0gZHJtL2FtZGdwdTogY2hhbmdlIE1N
SFVCIHJlZ2lzdGVyIGFjY2VzcyBmcm9tIE1NSU8gdG8gUkxDRw0KDQpbQU1EIE9mZmljaWFsIFVz
ZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQoNCkhpIEZlbGl4DQpUaGF0IGlz
IGEgZ3JlYXQgaWRlYSwgSSB3aWxsIHRyeSBpdC4NCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIA0KQlcNClBl
bmdqdSBaaG91DQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3VlaGxp
bmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPiANClNlbnQ6IFRodXJzZGF5LCBBcHJp
bCA4LCAyMDIxIDEwOjU4IFBNDQpUbzogWmhvdSwgUGVuZyBKdSA8UGVuZ0p1Llpob3VAYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDEv
OF0gZHJtL2FtZGdwdTogY2hhbmdlIE1NSFVCIHJlZ2lzdGVyIGFjY2VzcyBmcm9tIE1NSU8gdG8g
UkxDRw0KDQpHaXZlbiB0aGUgbnVtYmVyIG9mIGNhbGwtc2l0ZXMgYmVpbmcgbW9kaWZpZWQgaW4g
dGhpcyBwYXRjaCBzZXJpZXMsIHdvdWxkIGl0IGJlIGVhc2llciAoYW5kIG1vcmUgbWFpbnRhaW5h
YmxlKSB0byBjaGFuZ2UgdGhlIGJlaGF2aW91ciBvciB0aGUgcmVndWxhciByZWdpc3RlciBtYWNy
b3MgYW5kIGFkZCBOT19STEMgdmVyc2lvbnMgZm9yIHRoZSBleGNlcHRpb25zLCBzaW1pbGFyIHRv
IE5PX0tJUT8NCg0KUmVnYXJkcywNCsKgIEZlbGl4DQoNCkFtIDIwMjEtMDQtMDggdW0gNjoyMSBh
Lm0uIHNjaHJpZWIgUGVuZyBKdSBaaG91Og0KPiBGcm9tOiBwZW5nemhvdSA8UGVuZ0p1Llpob3VA
YW1kLmNvbT4NCj4NCj4gSW4gU1JJT1YgZW52aXJvbm1lbnQsIEtNRCBzaG91bGQgYWNjZXNzIE1N
SFVCIHJlZ2lzdGVycyB3aXRoIFJMQ0cgaWYgDQo+IE1NSFVCIGluZGlyZWN0IGFjY2VzcyBiaXQg
ZW5hYmxlZC4NCj4NCj4gQ2hhbmdlIE1NSFVCIHJlZ2lzdGVyIGFjY2VzcyBmcm9tIE1NSU8gdG8g
UkxDRy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogcGVuZ3pob3UgPFBlbmdKdS5aaG91QGFtZC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgIHwgMTIg
KysrKysrLS0gIA0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgfCAz
OSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3YxMF8wLmMNCj4gaW5kZXggMmJmZDYyMDU3NmYyLi40MjgxOGM0MGQwOGMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+IEBAIC0zOCw2ICszOCw3
IEBADQo+ICAjaW5jbHVkZSAic29jMTUuaCINCj4gICNpbmNsdWRlICJzb2MxNWQuaCINCj4gICNp
bmNsdWRlICJzb2MxNV9jb21tb24uaCINCj4gKyNpbmNsdWRlICJnYy9nY18xMF8xXzBfb2Zmc2V0
LmgiDQo+ICANCj4gICNpbmNsdWRlICJuYmlvX3YyXzMuaCINCj4gIA0KPiBAQCAtMjUzLDcgKzI1
NCwxMCBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hfdm1faHViKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLA0KPiAgCQkJRFJNX0VSUk9SKCJUaW1lb3V0IHdh
aXRpbmcgZm9yIHNlbSBhY3F1aXJlIGluIFZNIGZsdXNoIVxuIik7DQo+ICAJfQ0KPiAgDQo+IC0J
V1JFRzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX3JlcSArIGh1Yi0+ZW5nX2Rpc3RhbmNlICog
ZW5nLCBpbnZfcmVxKTsNCj4gKwlpZiAodm1odWIgPT0gQU1ER1BVX01NSFVCXzApDQo+ICsJCVdS
RUczMl9STENfTk9fS0lRKChodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZyksIGludl9yZXEpOw0K
PiArCWVsc2UNCj4gKwkJV1JFRzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZywg
aW52X3JlcSk7DQo+ICANCj4gIAkvKg0KPiAgCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0
IGZvciB0aGUgQUNLIHJlZ2lzdGVyIHRvIGJlIGNsZWFyZWQgQEAgDQo+IC0yODAsOCArMjg0LDEw
IEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF92bV9odWIoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsDQo+ICAJCSAqIGFkZCBzZW1hcGhvcmUgcmVsZWFzZSBh
ZnRlciBpbnZhbGlkYXRpb24sDQo+ICAJCSAqIHdyaXRlIHdpdGggMCBtZWFucyBzZW1hcGhvcmUg
cmVsZWFzZQ0KPiAgCQkgKi8NCj4gLQkJV1JFRzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX3Nl
bSArDQo+IC0JCQkgICAgICBodWItPmVuZ19kaXN0YW5jZSAqIGVuZywgMCk7DQo+ICsJCWlmICh2
bWh1YiA9PSBBTURHUFVfTU1IVUJfMCkNCj4gKwkJCVdSRUczMl9STENfTk9fS0lRKGh1Yi0+dm1f
aW52X2VuZzBfc2VtICsgZW5nLCAwKTsNCj4gKwkJZWxzZQ0KPiArCQkJV1JFRzMyX05PX0tJUSho
dWItPnZtX2ludl9lbmcwX3NlbSArIGVuZywgMCk7DQo+ICANCj4gIAlzcGluX3VubG9jaygmYWRl
di0+Z21jLmludmFsaWRhdGVfbG9jayk7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9tbWh1Yl92Ml8wLmMNCj4gaW5kZXggZGE3ZWRkMWVkNmIyLi5lOGVjZGYzODMxOTIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMNCj4gQEAgLTI5LDYg
KzI5LDcgQEANCj4gICNpbmNsdWRlICJtbWh1Yi9tbWh1Yl8yXzBfMF9kZWZhdWx0LmgiDQo+ICAj
aW5jbHVkZSAibmF2aTEwX2VudW0uaCINCj4gIA0KPiArI2luY2x1ZGUgImdjL2djXzEwXzFfMF9v
ZmZzZXQuaCINCj4gICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCINCj4gIA0KPiAgI2RlZmluZSBt
bU1NX0FUQ19MMl9NSVNDX0NHX1NpZW5uYV9DaWNobGlkICAgICAgICAgICAgICAgICAgICAgIDB4
MDY0ZA0KPiBAQCAtMTY1LDExICsxNjYsMTEgQEAgc3RhdGljIHZvaWQgbW1odWJfdjJfMF9zZXR1
cF92bV9wdF9yZWdzKHN0cnVjdCANCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1p
ICB7DQo+ICAJc3RydWN0IGFtZGdwdV92bWh1YiAqaHViID0gJmFkZXYtPnZtaHViW0FNREdQVV9N
TUhVQl8wXTsNCj4gIA0KPiAtCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsIG1tTU1WTV9D
T05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9MTzMyLA0KPiArCVdSRUczMl9TT0MxNV9PRkZT
RVRfUkxDKE1NSFVCLCAwLCANCj4gK21tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQURE
Ul9MTzMyLA0KPiAgCQkJICAgIGh1Yi0+Y3R4X2FkZHJfZGlzdGFuY2UgKiB2bWlkLA0KPiAgCQkJ
ICAgIGxvd2VyXzMyX2JpdHMocGFnZV90YWJsZV9iYXNlKSk7DQo+ICANCj4gLQlXUkVHMzJfU09D
MTVfT0ZGU0VUKE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJf
SEkzMiwNCj4gKwlXUkVHMzJfU09DMTVfT0ZGU0VUX1JMQyhNTUhVQiwgMCwgDQo+ICttbU1NVk1f
Q09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiwNCj4gIAkJCSAgICBodWItPmN0eF9h
ZGRyX2Rpc3RhbmNlICogdm1pZCwNCj4gIAkJCSAgICB1cHBlcl8zMl9iaXRzKHBhZ2VfdGFibGVf
YmFzZSkpOyAgfSBAQCAtMTgwLDE0ICsxODEsMTQgQEAgDQo+IHN0YXRpYyB2b2lkIG1taHViX3Yy
XzBfaW5pdF9nYXJ0X2FwZXJ0dXJlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgDQo+ICphZGV2
KQ0KPiAgDQo+ICAJbW1odWJfdjJfMF9zZXR1cF92bV9wdF9yZWdzKGFkZXYsIDAsIHB0X2Jhc2Up
Ow0KPiAgDQo+IC0JV1JFRzMyX1NPQzE1KE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDBfUEFHRV9U
QUJMRV9TVEFSVF9BRERSX0xPMzIsDQo+ICsJV1JFRzMyX1NPQzE1X1JMQyhNTUhVQiwgMCwgDQo+
ICttbU1NVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9TVEFSVF9BRERSX0xPMzIsDQo+ICAJCSAgICAg
KHUzMikoYWRldi0+Z21jLmdhcnRfc3RhcnQgPj4gMTIpKTsNCj4gLQlXUkVHMzJfU09DMTUoTU1I
VUIsIDAsIG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX1NUQVJUX0FERFJfSEkzMiwNCj4gKwlX
UkVHMzJfU09DMTVfUkxDKE1NSFVCLCAwLCANCj4gK21tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxF
X1NUQVJUX0FERFJfSEkzMiwNCj4gIAkJICAgICAodTMyKShhZGV2LT5nbWMuZ2FydF9zdGFydCA+
PiA0NCkpOw0KPiAgDQo+IC0JV1JFRzMyX1NPQzE1KE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDBf
UEFHRV9UQUJMRV9FTkRfQUREUl9MTzMyLA0KPiArCVdSRUczMl9TT0MxNV9STEMoTU1IVUIsIDAs
IG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX0VORF9BRERSX0xPMzIsDQo+ICAJCSAgICAgKHUz
MikoYWRldi0+Z21jLmdhcnRfZW5kID4+IDEyKSk7DQo+IC0JV1JFRzMyX1NPQzE1KE1NSFVCLCAw
LCBtbU1NVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9FTkRfQUREUl9ISTMyLA0KPiArCVdSRUczMl9T
T0MxNV9STEMoTU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX0VORF9BRERSX0hJ
MzIsDQo+ICAJCSAgICAgKHUzMikoYWRldi0+Z21jLmdhcnRfZW5kID4+IDQ0KSk7ICB9DQo+ICAN
Cj4gQEAgLTE5Nyw5ICsxOTgsOSBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX2luaXRfc3lzdGVt
X2FwZXJ0dXJlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJdWludDMyX3Qg
dG1wOw0KPiAgDQo+ICAJLyogUHJvZ3JhbSB0aGUgQUdQIEJBUiAqLw0KPiAtCVdSRUczMl9TT0Mx
NShNTUhVQiwgMCwgbW1NTU1DX1ZNX0FHUF9CQVNFLCAwKTsNCj4gLQlXUkVHMzJfU09DMTUoTU1I
VUIsIDAsIG1tTU1NQ19WTV9BR1BfQk9ULCBhZGV2LT5nbWMuYWdwX3N0YXJ0ID4+IDI0KTsNCj4g
LQlXUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tTU1NQ19WTV9BR1BfVE9QLCBhZGV2LT5nbWMuYWdw
X2VuZCA+PiAyNCk7DQo+ICsJV1JFRzMyX1NPQzE1X1JMQyhNTUhVQiwgMCwgbW1NTU1DX1ZNX0FH
UF9CQVNFLCAwKTsNCj4gKwlXUkVHMzJfU09DMTVfUkxDKE1NSFVCLCAwLCBtbU1NTUNfVk1fQUdQ
X0JPVCwgYWRldi0+Z21jLmFncF9zdGFydCA+PiAyNCk7DQo+ICsJV1JFRzMyX1NPQzE1X1JMQyhN
TUhVQiwgMCwgbW1NTU1DX1ZNX0FHUF9UT1AsIGFkZXYtPmdtYy5hZ3BfZW5kID4+IA0KPiArMjQp
Ow0KPiAgDQo+ICAJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsNCj4gIAkJLyogUHJvZ3Jh
bSB0aGUgc3lzdGVtIGFwZXJ0dXJlIGxvdyBsb2dpY2FsIHBhZ2UgbnVtYmVyLiAqLyBAQCANCj4g
LTMwNCwxMiArMzA1LDEyIEBAIHN0YXRpYyB2b2lkIG1taHViX3YyXzBfZW5hYmxlX3N5c3RlbV9k
b21haW4oc3RydWN0IA0KPiBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KPiAgCXVpbnQzMl90IHRt
cDsNCj4gIA0KPiAtCXRtcCA9IFJSRUczMl9TT0MxNShNTUhVQiwgMCwgbW1NTVZNX0NPTlRFWFQw
X0NOVEwpOw0KPiArCXRtcCA9IFJSRUczMl9TT0MxNV9STEMoTU1IVUIsIDAsIG1tTU1WTV9DT05U
RVhUMF9DTlRMKTsNCj4gIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgTU1WTV9DT05URVhUMF9D
TlRMLCBFTkFCTEVfQ09OVEVYVCwgMSk7DQo+ICAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1N
Vk1fQ09OVEVYVDBfQ05UTCwgUEFHRV9UQUJMRV9ERVBUSCwgMCk7DQo+ICAJdG1wID0gUkVHX1NF
VF9GSUVMRCh0bXAsIE1NVk1fQ09OVEVYVDBfQ05UTCwNCj4gIAkJCSAgICBSRVRSWV9QRVJNSVNT
SU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7DQo+IC0JV1JFRzMyX1NPQzE1KE1NSFVCLCAw
LCBtbU1NVk1fQ09OVEVYVDBfQ05UTCwgdG1wKTsNCj4gKwlXUkVHMzJfU09DMTVfUkxDKE1NSFVC
LCAwLCBtbU1NVk1fQ09OVEVYVDBfQ05UTCwgdG1wKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZv
aWQgbW1odWJfdjJfMF9kaXNhYmxlX2lkZW50aXR5X2FwZXJ0dXJlKHN0cnVjdCBhbWRncHVfZGV2
aWNlIA0KPiAqYWRldikgQEAgLTM3MSwxNiArMzcyLDE2IEBAIHN0YXRpYyB2b2lkIG1taHViX3Yy
XzBfc2V0dXBfdm1pZF9jb25maWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJCXRt
cCA9IFJFR19TRVRfRklFTEQodG1wLCBNTVZNX0NPTlRFWFQxX0NOVEwsDQo+ICAJCQkJICAgIFJF
VFJZX1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULA0KPiAgCQkJCSAgICAhYWRldi0+
Z21jLm5vcmV0cnkpOw0KPiAtCQlXUkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVCLCAwLCBtbU1NVk1f
Q09OVEVYVDFfQ05UTCwNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVF9STEMoTU1IVUIsIDAsIG1t
TU1WTV9DT05URVhUMV9DTlRMLA0KPiAgCQkJCSAgICBpICogaHViLT5jdHhfZGlzdGFuY2UsIHRt
cCk7DQo+IC0JCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMV9Q
QUdFX1RBQkxFX1NUQVJUX0FERFJfTE8zMiwNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVF9STEMo
TU1IVUIsIDAsIA0KPiArbW1NTVZNX0NPTlRFWFQxX1BBR0VfVEFCTEVfU1RBUlRfQUREUl9MTzMy
LA0KPiAgCQkJCSAgICBpICogaHViLT5jdHhfYWRkcl9kaXN0YW5jZSwgMCk7DQo+IC0JCVdSRUcz
Ml9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMV9QQUdFX1RBQkxFX1NUQVJU
X0FERFJfSEkzMiwNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVF9STEMoTU1IVUIsIDAsIA0KPiAr
bW1NTVZNX0NPTlRFWFQxX1BBR0VfVEFCTEVfU1RBUlRfQUREUl9ISTMyLA0KPiAgCQkJCSAgICBp
ICogaHViLT5jdHhfYWRkcl9kaXN0YW5jZSwgMCk7DQo+IC0JCVdSRUczMl9TT0MxNV9PRkZTRVQo
TU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMV9QQUdFX1RBQkxFX0VORF9BRERSX0xPMzIsDQo+ICsJ
CVdSRUczMl9TT0MxNV9PRkZTRVRfUkxDKE1NSFVCLCAwLCANCj4gK21tTU1WTV9DT05URVhUMV9Q
QUdFX1RBQkxFX0VORF9BRERSX0xPMzIsDQo+ICAJCQkJICAgIGkgKiBodWItPmN0eF9hZGRyX2Rp
c3RhbmNlLA0KPiAgCQkJCSAgICBsb3dlcl8zMl9iaXRzKGFkZXYtPnZtX21hbmFnZXIubWF4X3Bm
biAtIDEpKTsNCj4gLQkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwgbW1NTVZNX0NPTlRF
WFQxX1BBR0VfVEFCTEVfRU5EX0FERFJfSEkzMiwNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVF9S
TEMoTU1IVUIsIDAsIA0KPiArbW1NTVZNX0NPTlRFWFQxX1BBR0VfVEFCTEVfRU5EX0FERFJfSEkz
MiwNCj4gIAkJCQkgICAgaSAqIGh1Yi0+Y3R4X2FkZHJfZGlzdGFuY2UsDQo+ICAJCQkJICAgIHVw
cGVyXzMyX2JpdHMoYWRldi0+dm1fbWFuYWdlci5tYXhfcGZuIC0gMSkpOw0KPiAgCX0NCj4gQEAg
LTM5Miw5ICszOTMsOSBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX3Byb2dyYW1faW52YWxpZGF0
aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCXVuc2lnbmVkIGk7DQo+ICANCj4g
IAlmb3IgKGkgPSAwOyBpIDwgMTg7ICsraSkgew0KPiAtCQlXUkVHMzJfU09DMTVfT0ZGU0VUKE1N
SFVCLCAwLCBtbU1NVk1fSU5WQUxJREFURV9FTkcwX0FERFJfUkFOR0VfTE8zMiwNCj4gKwkJV1JF
RzMyX1NPQzE1X09GRlNFVF9STEMoTU1IVUIsIDAsIA0KPiArbW1NTVZNX0lOVkFMSURBVEVfRU5H
MF9BRERSX1JBTkdFX0xPMzIsDQo+ICAJCQkJICAgIGkgKiBodWItPmVuZ19hZGRyX2Rpc3RhbmNl
LCAweGZmZmZmZmZmKTsNCj4gLQkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwgbW1NTVZN
X0lOVkFMSURBVEVfRU5HMF9BRERSX1JBTkdFX0hJMzIsDQo+ICsJCVdSRUczMl9TT0MxNV9PRkZT
RVRfUkxDKE1NSFVCLCAwLCANCj4gK21tTU1WTV9JTlZBTElEQVRFX0VORzBfQUREUl9SQU5HRV9I
STMyLA0KPiAgCQkJCSAgICBpICogaHViLT5lbmdfYWRkcl9kaXN0YW5jZSwgMHgxZik7DQo+ICAJ
fQ0KPiAgfQ0KPiBAQCAtNDIzLDcgKzQyNCw3IEBAIHN0YXRpYyB2b2lkIG1taHViX3YyXzBfZ2Fy
dF9kaXNhYmxlKHN0cnVjdCANCj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIA0KPiAgCS8qIERp
c2FibGUgYWxsIHRhYmxlcyAqLw0KPiAgCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTlVNX1ZNSUQ7
IGkrKykNCj4gLQkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwgbW1NTVZNX0NPTlRFWFQw
X0NOVEwsDQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVRfUkxDKE1NSFVCLCAwLCBtbU1NVk1fQ09O
VEVYVDBfQ05UTCwNCj4gIAkJCQkgICAgaSAqIGh1Yi0+Y3R4X2Rpc3RhbmNlLCAwKTsNCj4gIA0K
PiAgCS8qIFNldHVwIFRMQiBjb250cm9sICovDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
