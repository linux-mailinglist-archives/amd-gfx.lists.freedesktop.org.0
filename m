Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169024BD8ED
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Feb 2022 11:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326F710E334;
	Mon, 21 Feb 2022 10:06:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7310E334
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Feb 2022 10:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSbXldfFFkkR0+UWAK/Ndy2dabDX/wFC3a1K7G8hQmO6KT9s/hgGIK+b3Jx4Snh3jYJ83+C/iJRa2sLFTHG7hn2csq7WPE68Iva+Jph0whq8Ns4Y5AQFKAgVuiKZta5jaZ3jtbVbIX/NKL5080qQoXi9dshLoczGgJ+/5Rl/CH9pAGNabJ7OpDPCRAQa3Me0AYQW9LgpZmCM4b8d357jfODYbdUK8bsAyf6YP+s2YcBph7cwbIFgGxYtSNJyDDRbW/1IKugE0XzIwxajJjPvhRrLs339uRn5MRepK8895MCpsool5dMbzfubEujkL6ydns/7DddYHmqboZGW4TbMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puD+QlbRQfk1GLMROR4Zg5jTOFMh7OTWgqolkYrYfxY=;
 b=EDX8PZL/mq46shyhyv2rZdqBaMtY/OkvWq03TKP05powh+ybye5yG+esLuXCtGoTkI2S30ComeOBVPBfOuY06XZ7lYHOMJvttWVunh4bWgKyOTHbxEeTAo9eZu405qTjJLWToDNiqISTS2cbSqOrM7bVmsWA3n9TU4d9jZwk95iCSiStJ3NBgsLX6X9ZBe649Wf9Vdm/PwrgeEAHWkcLS9DW1dBUfjT64dsYEfF/x6nmdUZFlOXfuL0UP26nzkUSlR1A+zSNthAI+WuXVol3v+uRev+TnqrWgUlj+AcW41VFTOJti4y68J0iS94FPiTa0D1uQGq6FxbdaY4oGPjvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puD+QlbRQfk1GLMROR4Zg5jTOFMh7OTWgqolkYrYfxY=;
 b=olNKJttjyURRrWB9FQh84/I8cH4vqmY7ZtEjJeKiCjtJVaS7vrBqWS8amRpYZ2N8PmQnDBE86jyrDxBhdMt/4HZdARNnZNqPzS6gZcYe606Cdw8O27o42ZBmP7XAoDpqlqdbQIncdzK+TO7IZMMea1XLVlQK6/PJ3acN6i6+mg8=
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 10:06:39 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::922:40dc:9c59:b18d]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::922:40dc:9c59:b18d%2]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 10:06:39 +0000
From: "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Somalapuram, Amaranath"
 <Amaranath.Somalapuram@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/2] drm/amdgpu: add debugfs for reset registers list
Thread-Topic: [PATCH v8 1/2] drm/amdgpu: add debugfs for reset registers list
Thread-Index: AQHYJvLn7OR3Xw74R0OFt2naq3ltP6yduVgAgABnW4A=
Date: Mon, 21 Feb 2022 10:06:39 +0000
Message-ID: <DM6PR12MB389702E53C862BAE2FA8B840F83A9@DM6PR12MB3897.namprd12.prod.outlook.com>
References: <20220221071540.2485-1-Amaranath.Somalapuram@amd.com>
 <a588e193-3509-73b3-b0d6-962c2b72dc4c@amd.com>
In-Reply-To: <a588e193-3509-73b3-b0d6-962c2b72dc4c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-21T10:06:36Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=58d49246-3e9f-4362-90de-fe7fb69db706;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-exchange-imapappendstamp: DM6PR12MB3897.namprd12.prod.outlook.com
 (15.20.4995.027)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 760ee6d3-d058-47a2-afb5-08d9f521da1f
x-ms-traffictypediagnostic: DM5PR1201MB0122:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB0122FF42FCF2235D727F1CEDF83A9@DM5PR1201MB0122.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kkD3JvNXUAK2+8MZQPOTbcGV/W/NSzJtFvOmn1hUypwxXNANQ+M4zdAZlM3Ufdg6vobmigJG4RftUpTiGYTLohTkXikT01RmIRbpY47Y4maCkWXGFt1/uj+YRk+154phVJauHhFQRWufkx2OFwaG4HhDSHLwYuvIUr4kNfyX1Kc8GcAgKF1Uvt8GmlPuXaVcDW/Jsnzgvs1pfJ+FICwDHLQFsNMtqawstBk/yRVLwF2pmPaCd/qzuAseE/luiEiOyg8acqiF1ibaSnhHdQv9ygFmqfbRgSaFSKsR7YHcgojX1OtlY05Y7s7NIsU9f+0MuqPNsjrA0kKuFSY4ev728Ek9DJ/hjZ2Vou1hrJUiLrOZ2xuAPfr5wPCZ9V/aa9pGU8dl2hLIuTkIJC+Umh8Sj38fV+X6p2fj8P2lBuBNbby1Ji2ZHCX8k6g0P46UOFEYa5Ku8soKsk6alfD9xMb5KzgjMNKr9j3R5WOmzY98eMWcljli5v8C35xCr1s7Hka9ahJeSvWWTjxZzCYmezHhL5OvS+s3pYUB30nrHMvvtp2OoBNsX91IH7coOQnA8kdiWziPzH7gFW6NwRSek79H00HZiHR1Hlpr1gdx69Zc9niWTm3/G3ZLfNF/kmyTpxICZ8rThKd83EyUy+9wGm57GnFch5Y6l8n2I13IGrfbZhHmkYjkKX5Gunu5EEASB3+iOEG2yFhkSwXY7OZjjzZmoUpRwXS7r9SI26HTPk7lcqClZufJaD+PxIbcA26zsdUkT++1tq5WrwEXm93FqU3zqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38070700005)(38100700002)(66574015)(83380400001)(52536014)(5660300002)(55016003)(2906002)(8936002)(33656002)(8676002)(64756008)(54906003)(110136005)(7696005)(53546011)(186003)(76116006)(66556008)(66946007)(9686003)(6506007)(26005)(122000001)(66446008)(316002)(508600001)(71200400001)(66476007)(65966003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk45TzdQR1VzTDYyU0tLMDI3c0txa2g5aC9hSU9jSkw3MG1YbU1OMkZCV2lz?=
 =?utf-8?B?cVUyeVkrbk1WVEt6RE45S25LMEgzTHFyQ1Eya0Vld3NXdE1CdDdMRWxQQXBU?=
 =?utf-8?B?Ry9peWJWbXJwMVJ0V0w1VzJpTkFSNHgyN1YxSjBFOVhxeUpERUZQWncweEZO?=
 =?utf-8?B?ZjBZK2lrYjA5RnhIenE4Vjhhd1BCSGg3Z25ZOWxRdkY5cXZlQyt4NnAwN3E0?=
 =?utf-8?B?RFFsKzZDVEM4Z0M1OGZ5WDJvVk9pV296UUQwN2tGL2pzRWtCQy9UYkQ5ckwy?=
 =?utf-8?B?dzkyVUNnWDRuaUxFR0R3WldXSm53U0hyOUNITHhUZC8yNHJSYXdyUyt2eUFx?=
 =?utf-8?B?Skh1aEJzekVROEdjY3Izak5kM2tCMXIxL3U2dEIxTVB4VFlHTmI5TmZmVkcz?=
 =?utf-8?B?YjEwVVpTRGlmdVJDV0V1ZWdhcXVRaGRrbHlRT21UamJaYWZESE1tS2trMDg3?=
 =?utf-8?B?ZFlrSHMwNnNrOHFGNTMwcm9tSVR0M0gwak1NaXRIZUJTNkFJTHU4cTNZdFFQ?=
 =?utf-8?B?NGE3UzJGbFMyRTJtUHYrbHp4MUlMV3dRUldTYVRvdDRzMURLOWc1Q1VER2hy?=
 =?utf-8?B?Z1ppVzhXS1Z3MUg0Z3d6ZUp3a0NMRkY0bk9BWmtLRVA0dnBleGZaMFkyTWdp?=
 =?utf-8?B?eW05RitlaEZucmRUVDJTRzcxcitOdGYzMmpFRE9IR1NiTHE3VlJDclVONkZE?=
 =?utf-8?B?STRETngwT3BBbWNtTWNtTEFYS05yT1lxRVBhLytLczV0UDg2Qzl2RTV6UW83?=
 =?utf-8?B?SnlWTGM1M290Mk15WDBLeml4VmI5Q29iY2lxK2hCOVB5YVV5YzBmaUoyT29u?=
 =?utf-8?B?SlJWd3grZWZPc2c4am5XcVIrSkVRSXJnY0F0WHJkbTd2dzk5SDFuYzl6TDFY?=
 =?utf-8?B?RGlvM3RIdzBCZnYzbHkvREJ4cWZBUmtNNnBsQ0RIUDIwZDlUeHNTZE9BZ203?=
 =?utf-8?B?RWVyRDU3ajZEOXR5VHUybFhIK214UlJOU1F4UlFIRVZORU5PcGpFTEtUeUgw?=
 =?utf-8?B?NnVZM0NKT24xbGNkYkpKYTFrU1JaTVNIckhnVExHTytWVEF4MjBwV1cxUklY?=
 =?utf-8?B?ZnFaZEc2dFFqa25qUDBKaytPZjNieHh4bVhJcnRvQWF6NkxLZUxuQktTT2tq?=
 =?utf-8?B?VTNvdHdwU3RVTWRCNDVqNXdlOWZCYjJqbUFOajFCbFhhV1c4S1hoc3UwdW90?=
 =?utf-8?B?d1FmaDlEK0F2NWxGQU1mRlA3Uk5KN1g0SHJwWElmeTdsUGNJdUJkdVp1ZHZU?=
 =?utf-8?B?aDFiak5aV1FhZmxyY0pKTTJaZVlXMnc4dmFVb2ptOTByWWlrbDUxTFk3SElr?=
 =?utf-8?B?MVVkUTNoYUlkS2Q5YUxoRURaUldreEY0Y21YZHJBTzdmMEM0TG9NWnJ2RXMw?=
 =?utf-8?B?eXJvTGRYeDlTWVBYNm1nZFRMYk5GcWxid3BxV29OM0dUc2VJRHl0NnVhenFJ?=
 =?utf-8?B?MmxVYlNVQkxBbTFjU1BXZGxlYWx3eTRCZXpRWW1wZVhHYUh3djNxd0hLOHdq?=
 =?utf-8?B?UjNQTXJFS2JwMk9VTVdIQlJLU3B6bFdYQjE3UlhkeGFnazV3d1RETmVDT0FK?=
 =?utf-8?B?UXowaVJ2RDA4dVhQRVZBUWE3V1RxWUs0R0pkdE9tZE0xaFREM1pZM0ZMSEFy?=
 =?utf-8?B?Q2N3TTJyR0hnV3VlTVdXb2xaTXdLbDlyOEhISFFta01ncWRiaDI2UEV3ZjVW?=
 =?utf-8?B?eExzUitLcy9uS2E1ekdnMVpqb2J1MUpHRWpXMzZNSHU2OVlRNXF4QW1yTCtp?=
 =?utf-8?B?eTVSRi93ZThNR2pGV2IxNW4wSFRuZTBJNGZDZGMwejNkSzkrZkV0QmVuLzlS?=
 =?utf-8?B?NStrRmIzcitmVXhXQUJhZ3ljQ1ZXZ0JXb3JwVWFXZ0g1VHNuTFVMZ3ZRQ1Vo?=
 =?utf-8?B?T2NJVi9TczlBOTdGK0I5UnNRak9xaU9iS3YvNmo3SW5FV3pWdE5qbjdzMnYz?=
 =?utf-8?B?MDRsRGVvbWtKNUlTT1BmUkhtdUNTMGtLb2dWZzhUQllLNTlFRXdWU2FCWUw0?=
 =?utf-8?B?cnVjekloL3pQelZjOFhIVU4zZnk3cVh2M1FJWVNVYjdZV3poeStNRjY3Zkk1?=
 =?utf-8?B?YU5YVUxOV2lUa2JtbFJDL3JsblVZenZPMmZhQ2RFbDZaWVV3UHhRWkRZdlIw?=
 =?utf-8?B?bjh3bWRXdHd0NTYxSTFrenFQT2p6TitPekFOTkNqaElVcnNJeHNFSGFFOTRZ?=
 =?utf-8?Q?i76YLCLkZD0IbUaqjlfWiFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAB7ECAFAC237A498FA9535F644DAE30@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760ee6d3-d058-47a2-afb5-08d9f521da1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 10:06:39.0621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gw8GVFSZHPAmT8CTXHvPRgRQiy0NlpgtOdYP7br3h2+rFI4YpUKqudYj/K9WgdOjE1okPEHUG+elQMBtl0ViCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQpPbiAyLzIxLzIwMjIgMjo0NSBQTSwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToNCj4NCj4NCj4gQW0gMjEuMDIuMjIgdW0gMDg6MTUgc2NocmllYiBT
b21hbGFwdXJhbSBBbWFyYW5hdGg6DQo+PiBMaXN0IG9mIHJlZ2lzdGVyIHBvcHVsYXRlZCBmb3Ig
ZHVtcCBjb2xsZWN0aW9uIGR1cmluZyB0aGUgR1BVIHJlc2V0Lg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFNvbWFsYXB1cmFtIEFtYXJhbmF0aCA8QW1hcmFuYXRoLlNvbWFsYXB1cmFtQGFtZC5jb20+
DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5owqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCA0ICsNCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZWJ1Z2ZzLmMgfCAxMTQgKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oDQo+PiBpbmRleCBiODViNjdhODhhM2QuLjZlMzVmMmM0Yzg2OSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gQEAgLTEwOTcsNiArMTA5Nywx
MCBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7DQo+PiDCoCDCoMKgwqDCoMKgIHN0cnVjdCBhbWRn
cHVfcmVzZXRfY29udHJvbMKgwqDCoMKgICpyZXNldF9jbnRsOw0KPj4gwqDCoMKgwqDCoCB1aW50
MzJfdCBpcF92ZXJzaW9uc1tIV19JRF9NQVhdW0hXSVBfTUFYX0lOU1RBTkNFXTsNCj4+ICsNCj4+
ICvCoMKgwqAgLyogcmVzZXQgZHVtcCByZWdpc3RlciAqLw0KPj4gK8KgwqDCoCB1aW50MzJfdMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKnJlc2V0X2R1bXBfcmVnX2xpc3Q7DQo+PiArwqDCoMKgIGlu
dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG51bV9yZWdzOw0KPj4gwqAgfTsNCj4+IMKgIMKgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmRybV90b19hZGV2KHN0cnVjdCBkcm1fZGV2aWNlIA0KPj4gKmRkZXYpDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyAN
Cj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPj4gaW5k
ZXggMTY0ZDZhOWU5ZmJiLi4xNGFkOTYxMGY4MDUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jDQo+PiBAQCAtMTYwOSw2ICsxNjA5LDExOCBA
QCBERUZJTkVfREVCVUdGU19BVFRSSUJVVEUoZm9wc19pYl9wcmVlbXB0LCBOVUxMLA0KPj4gwqAg
REVGSU5FX0RFQlVHRlNfQVRUUklCVVRFKGZvcHNfc2Nsa19zZXQsIE5VTEwsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfZGVidWdmc19zY2xrX3NldCwgIiVsbHVcbiIpOw0K
Pj4gwqAgK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9yZXNldF9kdW1wX3JlZ2lzdGVyX2xpc3RfcmVh
ZChzdHJ1Y3QgZmlsZSAqZiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hh
ciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IHNpemUsIGxvZmZfdCAqcG9zKQ0KPj4gK3sNCj4+ICvCoMKg
wqAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgDQo+
PiAqKWZpbGVfaW5vZGUoZiktPmlfcHJpdmF0ZTsNCj4+ICvCoMKgwqAgY2hhciByZWdfb2Zmc2V0
WzExXTsNCj4+ICvCoMKgwqAgdWludDMyX3QgbnVtX3JlZ3M7DQo+PiArwqDCoMKgIGludCBpLCBy
ZXQsIGxlbiA9IDA7DQo+PiArDQo+PiArwqDCoMKgIGlmICgqcG9zKQ0KPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAwOw0KPj4gKw0KPj4gK8KgwqDCoCByZXQgPSBkb3duX3JlYWRfa2lsbGFibGUo
JmFkZXYtPnJlc2V0X3NlbSk7DQo+PiArDQo+PiArwqDCoMKgIGlmIChyZXQpDQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+ICsNCj4+ICvCoMKgwqAgbnVtX3JlZ3MgPSBhZGV2LT5u
dW1fcmVnczsNCj4+ICsNCj4+ICvCoMKgwqAgdXBfcmVhZCgmYWRldi0+cmVzZXRfc2VtKTsNCj4+
ICsNCj4+ICvCoMKgwqAgaWYgKG51bV9yZWdzID09IDApDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7DQo+DQo+IEkgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhhdCBjYXVzZSBpdCBqdXN0IGF2
b2lkcyB0aGUgZmluYWwgXG4uDQo+DQpvay4NCj4+ICsNCj4+ICvCoMKgwqAgZm9yIChpID0gMDsg
aSA8IG51bV9yZWdzOyBpKyspIHsNCj4NCj4gVGhhdCdzIHByZXR0eSBjbG9zZSwgYnV0IG9uZSBw
cm9ibGVtIGlzIHN0aWxsIHRoYXQgaXQgaXMgcG9zc2libGUgdGhhdCANCj4gdGhlIG51bWJlciBv
ZiByZWdpc3RlciBiZWNvbWVzIG11Y2ggc21hbGxlciB3aGlsZSB0aGlzIGxvb3AgcnVucy4NCj4N
Cj4gVHJ5IGl0IGxpa2UgdGhpcyBpbnN0ZWFkOg0KPg0KPiBkb3duX3JlYWRfa2lsbGFibGUoLi4u
KQ0KPiBmb3IgKGkgPSAwOyBpIDwgYWRldi0+bnVtX3JlZ3M7ICsraSkgew0KPiDCoMKgwqAgc3By
aW50ZiguLi4pDQo+IMKgwqDCoCB1cF9yZWFkKC4uLik7DQo+DQo+IMKgwqDCoCBjb3B5X3RvX3Vz
ZXIoDQo+DQo+IMKgwqDCoCBkb3duX3JlYWRfa2lsbGFibGUoLi4uKQ0KPiB9DQo+IHVwX3JlYWQo
KS4NCj4NCkkgY3JlYXRlZCBsb2NhbCBudW1fcmVncyB0byBhdm9pZCBsb2NrIG91c3RlZCB0aGUg
bG9vcC4gSSBndWVzcyB5b3UgbWUgDQp0byByZW1vdmUgPw0KDQpzbyB3ZSBjYW4gaG9sZCB1cF9y
ZWFkIGluc2lkZSB0aGUgbG9vcCA/DQoNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBk
b3duX3JlYWRfa2lsbGFibGUoJmFkZXYtPnJlc2V0X3NlbSk7DQo+PiArDQo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgc3ByaW50ZihyZWdfb2Zmc2V0LCAiMHgleCAiLCBhZGV2
LT5yZXNldF9kdW1wX3JlZ19saXN0W2ldKTsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCB1cF9y
ZWFkKCZhZGV2LT5yZXNldF9zZW0pOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGNv
cHlfdG9fdXNlcihidWYgKyBsZW4sIHJlZ19vZmZzZXQsIHN0cmxlbihyZWdfb2Zmc2V0KSk7DQo+
PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUZBVUxUOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGxlbiArPSBzdHJs
ZW4ocmVnX29mZnNldCk7DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgcmV0ID0gY29w
eV90b191c2VyKGJ1ZiArIGxlbiwgIlxuIiwgMSk7DQo+PiArDQo+PiArwqDCoMKgIGlmIChyZXQp
DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+PiArDQo+PiArwqDCoMKgIGxl
bisrOw0KPj4gK8KgwqDCoCAqcG9zICs9IGxlbjsNCj4+ICsNCj4+ICvCoMKgwqAgcmV0dXJuIGxl
bjsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jlc2V0X2R1bXBfcmVn
aXN0ZXJfbGlzdF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IGNoYXIgX191c2VyICpidWYsIHNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykNCj4+
ICt7DQo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRn
cHVfZGV2aWNlIA0KPj4gKilmaWxlX2lub2RlKGYpLT5pX3ByaXZhdGU7DQo+PiArwqDCoMKgIGNo
YXIgKnJlZ19vZmZzZXQsICpyZWcsIHJlZ190ZW1wWzExXTsNCj4+ICvCoMKgwqAgdWludDMyX3Qg
KnRtcF9saXN0Ow0KPj4gK8KgwqDCoCBpbnQgcmV0LCBpID0gMCwgbGVuID0gMDsNCj4+ICsNCj4+
ICvCoMKgwqAgZG8gew0KPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ19vZmZzZXQgPSByZWdfdGVtcDsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBtZW1zZXQocmVnX29mZnNldCwgMCwgMTEpOw0KPj4gK8KgwqDC
oMKgwqDCoMKgIHJldCA9IGNvcHlfZnJvbV91c2VyKHJlZ19vZmZzZXQsIGJ1ZiArIGxlbiwgbWlu
KDExLCANCj4+ICgoaW50KXNpemUtbGVuKSkpOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChyZXQpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKHRtcF9saXN0KTsNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOw0KPj4gK8KgwqDCoMKgwqDC
oMKgIH0NCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSBzdHJzZXAoJnJlZ19vZmZzZXQs
ICIgIik7DQo+PiArwqDCoMKgwqDCoMKgwqAgdG1wX2xpc3QgPSBrcmVhbGxvY19hcnJheSh0bXBf
bGlzdCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLCBzaXpl
b2YodWludDMyX3QpLCBHRlBfS0VSTkVMKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBrc3Ry
dG91aW50KHJlZywgMTYsICZ0bXBfbGlzdFtpXSk7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUodG1wX2xpc3QpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+PiArwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGxlbiArPSBzdHJsZW4ocmVnKSArIDE7
DQo+PiArwqDCoMKgwqDCoMKgwqAgaSsrOw0KPj4gKw0KPj4gK8KgwqDCoCB9IHdoaWxlIChsZW4g
PCBzaXplKTsNCj4+ICsNCj4+ICvCoMKgwqAgcmV0ID0gZG93bl9yZWFkX2tpbGxhYmxlKCZhZGV2
LT5yZXNldF9zZW0pOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAocmV0KSB7DQo+PiArwqDCoMKgwqDC
oMKgwqAga2ZyZWUodG1wX2xpc3QpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
PiArwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAga2ZyZWUoYWRldi0+cmVzZXRfZHVtcF9yZWdf
bGlzdCk7DQo+PiArDQo+PiArwqDCoMKgIHN3YXAoYWRldi0+cmVzZXRfZHVtcF9yZWdfbGlzdCwg
dG1wX2xpc3QpOw0KPg0KPiBKdXN0IGFuIGFzc2lnbm1lbnQgaXMgc3VmZmljaWVudCBoZXJlIGlm
IHlvdSBkbyB0aGUga2ZyZWUgYmVmb3JlIHNpbmNlIA0KPiB0bXBfbGlzdCBpc24ndCB1c2VkIGFm
dGVyIHRoYXQuDQoNClRoaXMgaXMgcmVxdWlyZWQuIHdoYXQgaGFwcGVucyB3aGVuIHRoZSBmdW5j
dGlvbiBpcyBjYWxsZWQgZm9yIHRoZSANCnNlY29uZCB0aW1lICh0aGUgb2xkIHRtcF9saXN0IHdp
bGwgbmV2ZXIgYmUgZnJlZWQpDQoNCnRtcF9saXN0IGlzIGFsc28gZnJlZWQgYXMgaXRzIGNhbiBy
ZXR1cm4gZnJvbSB0aGUgbWlkZGxlIG9mIHRoZSBsb29wIGFuZCANCnRtcF9saXN0wqAgd2lsbCBu
ZXZlciBiZSBmcmVlZC4NCg0KPg0KPj4gK8KgwqDCoCBhZGV2LT5udW1fcmVncyA9IGk7DQo+PiAr
DQo+PiArwqDCoMKgIHVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7DQo+DQo+IFRoaXMgc2hvdWxk
IGJlIGEgZG93bl93cml0ZV9raWxsYWJsZSgpIGFuZCB1cF93cml0ZSgpIHRvIGF2b2lkIA0KPiBj
b25jdXJyZW50IHJlYWRzLg0KDQpJIHRyaWVkIGJ1dCBzb21lIHRpbWUgaXQgd2FzIGRlYWRsb2Nr
IHdoaWxlIHRlc3RpbmcuIChzb21lIG9uIGluIGRyaXZlciANCmhvbGRpbmcgcmVzZXRfc2VtKS4N
Cg0KTGV0IG1lIHRlc3QgaXQgb25jZSBhZ2Fpbi4NCg0KPg0KPg0KPiBBcGFydCBmcm9tIHRoYXQg
dGhlIHdyaXRlIGZ1bmN0aW9uIG5vdyBsb29rcyBjbGVhbi4NCj4NCmRvIHdlIG5lZWQgZG93bl9y
ZWFkX2tpbGxhYmxlIGluIHRoZSBiZWxvdyBmdW5jdGlvbiAoc2Vjb25kIHBhdGNoKSA/DQoNCg0K
K3N0YXRpYyBpbnQgYW1kZ3B1X3Jlc2V0X3JlZ19kdW1wcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCit7DQorCXVpbnQzMl90IHJlZ192YWx1ZTsNCisJaW50IGk7DQorDQorCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT5udW1fcmVnczsgaSsrKSB7DQorCQlyZWdfdmFsdWUgPSBSUkVHMzIoYWRl
di0+cmVzZXRfZHVtcF9yZWdfbGlzdFtpXSk7DQorCQl0cmFjZV9hbWRncHVfcmVzZXRfcmVnX2R1
bXBzKGFkZXYtPnJlc2V0X2R1bXBfcmVnX2xpc3RbaV0sIHJlZ192YWx1ZSk7DQorCX0NCisNCisJ
cmV0dXJuIDA7DQorfQ0KDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4NCj4+ICsNCj4+ICvC
oMKgwqAgcmV0dXJuIHNpemU7DQo+PiArfQ0KPj4gKw0KPj4gKw0KPj4gKw0KPj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGFtZGdwdV9yZXNldF9kdW1wX3JlZ2lzdGVyX2xp
c3QgPSB7DQo+PiArwqDCoMKgIC5vd25lciA9IFRISVNfTU9EVUxFLA0KPj4gK8KgwqDCoCAucmVh
ZCA9IGFtZGdwdV9yZXNldF9kdW1wX3JlZ2lzdGVyX2xpc3RfcmVhZCwNCj4+ICvCoMKgwqAgLndy
aXRlID0gYW1kZ3B1X3Jlc2V0X2R1bXBfcmVnaXN0ZXJfbGlzdF93cml0ZSwNCj4+ICvCoMKgwqAg
Lmxsc2VlayA9IGRlZmF1bHRfbGxzZWVrDQo+PiArfTsNCj4+ICsNCj4+IMKgIGludCBhbWRncHVf
ZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gwqAgew0KPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgZGVudHJ5ICpyb290ID0gYWRldl90b19kcm0oYWRldiktPnByaW1hcnkt
PmRlYnVnZnNfcm9vdDsNCj4+IEBAIC0xNjcyLDYgKzE3ODQsOCBAQCBpbnQgYW1kZ3B1X2RlYnVn
ZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2KQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1kZ3B1X2RlYnVnZnNfdGVzdF9pYl9mb3BzKTsNCj4+
IMKgwqDCoMKgwqAgZGVidWdmc19jcmVhdGVfZmlsZSgiYW1kZ3B1X3ZtX2luZm8iLCAwNDQ0LCBy
b290LCBhZGV2LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1kZ3B1
X2RlYnVnZnNfdm1faW5mb19mb3BzKTsNCj4+ICvCoMKgwqAgZGVidWdmc19jcmVhdGVfZmlsZSgi
YW1kZ3B1X3Jlc2V0X2R1bXBfcmVnaXN0ZXJfbGlzdCIsIDA2NDQsIA0KPj4gcm9vdCwgYWRldiwN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFtZGdwdV9yZXNldF9kdW1wX3Jl
Z2lzdGVyX2xpc3QpOw0KPj4gwqAgwqDCoMKgwqDCoCBhZGV2LT5kZWJ1Z2ZzX3ZiaW9zX2Jsb2Iu
ZGF0YSA9IGFkZXYtPmJpb3M7DQo+PiDCoMKgwqDCoMKgIGFkZXYtPmRlYnVnZnNfdmJpb3NfYmxv
Yi5zaXplID0gYWRldi0+Ymlvc19zaXplOw0KPg==
