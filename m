Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E46EDEC2
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Apr 2023 11:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430AE10E6D1;
	Tue, 25 Apr 2023 09:08:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C663210E6D1
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Apr 2023 09:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liYqM7rK1K1xdHELImHprSufmDT0h9DOJfB3kjiDAtzt4dfAoUeu6s4IEC0l0c6Pi1o0uDX8q3ub7Z2ya8MCW8rniT52b4tXwlZbuNI2bZIILVm4gRshqnl7eYn8WRSYfDC+kP0Q/IZlFv6UmWQjnw2jAOrqHxJv3GKoLogNXt0BzKXEQlUj6TZC0bYGQY6hGLZFLX8kQxrpCfOtVB3cuAmOBkaGGthVJVXnJ53QyHG1zKK9SuU07qKTYcqLdwxmmSjBcaq9dSuajJhNh5to2v+taKAPJqUW9hzouNzaip79a37S9opnmfXu+RhaJt0XJHugprUN3HGDg8w/u0Zh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMuWajPVA4u1vOyuw25rlufb8OyWepUwsc4ayFQPZS0=;
 b=fK2R89yhuZjp8BlEGyv3gLCULy1YwjWMli9wyDy5LAc6XRGNPgD3dZsg7TcW9gXJUHrhfY+p1Tkn86KJR+DQ8HIW2C3QmtfBticobGSfndJrGR2mCh2HoKnBRw/9wYKnsdMbvr5Uxw8oXWZwYIS4RG8fUGKpvCHjPJepq6xXs5t7FDEZFS3FlKsd73taddoxRBsuMJtFhBIBvcm0FIJbJT1up1lLDxJJlfzOUeDT1q0Q3fOKkmM409ovtMYyuM+FWJ+zw+FpZusfg8VYA4Lygg2m3s3wLVYdGrIOiCkyFO6OgYXfKap01rn2l4VmUNuON7zkGlZJ14j9VK3hmjX+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMuWajPVA4u1vOyuw25rlufb8OyWepUwsc4ayFQPZS0=;
 b=tTpnyJ+7bX1xfDtllsM18+AJABc3cKTd+rqFpHLIZHg0ffQmmZKSSwxvOgMj0cqmMgZb99aFzTMxm/dpZdficPDTyfhPI2o+BAKGvF6YBmtySKALsiUeO7T1cIouVTyZPfy31rVYfNaGoW10ya1sQOmGmChBERkN0KG7mCXNeFM=
Received: from DM4PR12MB5261.namprd12.prod.outlook.com (2603:10b6:5:398::22)
 by DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:08:52 +0000
Received: from DM4PR12MB5261.namprd12.prod.outlook.com
 ([fe80::5cad:78df:6b83:6127]) by DM4PR12MB5261.namprd12.prod.outlook.com
 ([fe80::5cad:78df:6b83:6127%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:08:52 +0000
From: "Xiao, Shane" <shane.xiao@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Enable doorbell selfring if resize BAR
 successfully
Thread-Topic: [PATCH] drm/amdgpu: Enable doorbell selfring if resize BAR
 successfully
Thread-Index: AQHZccK2PHIdMCo/skGPhrTuoVhwe686NNYAgAAKOyCAAD2f4IAAYOSAgAATL4CAAFIEAIAAD/4ggABwoACAAAN8EA==
Date: Tue, 25 Apr 2023 09:08:52 +0000
Message-ID: <DM4PR12MB5261A39EEE5367AC78BC57659D649@DM4PR12MB5261.namprd12.prod.outlook.com>
References: <20230418065443.878721-1-shane.xiao@amd.com>
 <9885713a-b424-dddc-f891-ed7d622c5b91@gmail.com>
 <DM4PR12MB5261E710B9A6F7BA6BF52F009D679@DM4PR12MB5261.namprd12.prod.outlook.com>
 <DM4PR12MB52615C85D3EA998E157686AD9D679@DM4PR12MB5261.namprd12.prod.outlook.com>
 <ac04f565-8336-fff6-e93b-a3021613558e@amd.com>
 <CADnq5_MFCad6wRFV=tQ6w+QFDsjbQB614dE=-6Hx+9qf++aSUw@mail.gmail.com>
 <BL1PR12MB52378B1F4549126C771815E7F0649@BL1PR12MB5237.namprd12.prod.outlook.com>
 <DM4PR12MB526168C8C138DC23FC68D8DD9D649@DM4PR12MB5261.namprd12.prod.outlook.com>
 <67efa777-b4b2-ce72-3003-b4a00c1bcfc3@gmail.com>
In-Reply-To: <67efa777-b4b2-ce72-3003-b4a00c1bcfc3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-04-25T09:08:50Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=967a0ac7-88f7-498e-a5d9-7a29e124156a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-04-25T09:08:50Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 1aafb38d-90d7-4a00-932f-2c77b57c6658
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5261:EE_|DM4PR12MB5295:EE_
x-ms-office365-filtering-correlation-id: 7208475d-9a25-4b83-5c48-08db456cb092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aSwpaTy/87HF8VIcOVHVutuW/DgJkC23mkSDjTEmeFy1K5g0mvfspLjvHDW+zYU+iRX9d3BF9aTszS5FvIn5NkunbF3gGbOGeq4EZmQKFeGe0vt9NLahzCsiyxjsaw4/rJ3CAKYxMCHN3ZuAyuvTBdAnDx7plbZrrHw7//ZQu9j+CsHFemfE+7JCWNt4NPJ7ReKveFaMfnZj3/MuIJiELCt+34Q4rx9rp+leTrrWGDd/OfHWLiPwYFwWWqSzdgM6QArs1i7ikd+SoZIo/itmzH/7qzK1XixSvzYqEwG7GBsMmXwupsshuAHCipVLKPC0RK+Zk1cQ+6Wcf1uzeimIECSyyAN+zvh85oIv78q8ICMN1AfgOTPfh103lIFeQ/vXshK3gJ88126KuXcE8CVVJ0YHjjLriXMDpUntfCd4rb7TIMR76k6zmAUw/xpVQ3WEgWxz5TIGB7263tDQZbayWu1pBB8NPmsR7mVKV6ftRXsCTinp5oe29EYqnuoywMQUdaQCI42BUf6+KosO9LIIbiFAcnjaOCZyM2U5uz9S3k8m9TEBrcqFuTbqcp4P2yrevgxNTCCzZ2S/cPxF+FI2I/J0Xsua18qfPJmwKoB478k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5261.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(2906002)(71200400001)(7696005)(55016003)(6506007)(9686003)(186003)(53546011)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(8676002)(8936002)(41300700001)(4326008)(316002)(26005)(478600001)(6636002)(52536014)(5660300002)(54906003)(110136005)(38070700005)(122000001)(38100700002)(86362001)(33656002)(83380400001)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0ZXRlNOLytuNlFmQkhlUkhocG8rT3plVUNIYmk2S1JYaGN6NVRkWGZmMGFZ?=
 =?utf-8?B?d2xUdkVvUFdjVE9LVU5mWmRlT3RPc2txTktZanpvNldneFdGR2xUK3dKdzAw?=
 =?utf-8?B?VTlHMkErOXByTldnNTU1WnFaUDdEYTBGbE1NQ3pPR0FRbzE5M0JseDU5NDNH?=
 =?utf-8?B?ZFpGb2l5QjM0ZDBPMy93QWVmeWpjV3E2T0FyTVBVZTZ4TEsxdHBPUXVXVlFL?=
 =?utf-8?B?dXVxcFJNYlUzMGtCU28yeHBOY3FNdE5TUzBlUThmQkJ0TndrQmdmN25ubXpt?=
 =?utf-8?B?bnpiMDNsSEUwNnBBUjlkazNNZVpFUHlPZzl1eFRIc3VScVNYZk9RcXp0clds?=
 =?utf-8?B?d092dndUOGtucUZwZ2pOM0J4eCs2QmdYRFpPci9vblh6Tmx2Nlg0SjRHbWtD?=
 =?utf-8?B?S2xiZHJUU3ZuUzdramRlY3VVRGl2UXBkQjlJbW1PRkdCOGlmbEUxVVNGWjgz?=
 =?utf-8?B?NFlNaUhXaE1UM1ZFc1lENy9TT0lWZHp4aEE0U2lYZlVhb2dVSy9wbTlhWlEw?=
 =?utf-8?B?OVU2T29EdFNpeHZkMWdoQVdPQ2J1dTlwbHh1amQzYkdGMHMrVWhKYmJlclF6?=
 =?utf-8?B?RFNkVVVjcWppWXU0dGdXVERpeVVqVjd0QWR2Skw2enNSZEIzZ1Q3T3l6bThY?=
 =?utf-8?B?ME56WnBmb0NKOUFlcGxPRWRvVXdxS2FhMEhtSyt1ckZWYi90bUVQM2xqQUJL?=
 =?utf-8?B?MjhwRUMxZDBqOUNZZVBPYk5tYWZnOFR4ZmZPZm1TeWhKeFUxUlRNUG5HcENo?=
 =?utf-8?B?eTNZN1pHdnF6ZXY2UlNEQUU3TjdWNUhVZ2k0VDNnNm5wRUFZbDBQZWhtZUNx?=
 =?utf-8?B?d0RqSStQSWpRU1BOUVNqQ2IvQTg5WTNDVy85cytMT3NidDBCT3kwVGNEV2l0?=
 =?utf-8?B?MldwbHFhbTNjOWVnMEtuL3hpdkIwWk5idzVIWGlPdGJPbDZ4d1hrUGRCWmky?=
 =?utf-8?B?dGlTUHJmYXlHNTlDSkh1QXNDOTk1M1JlUFZ5dDhMYjJJR2R5QW5mSU10RG81?=
 =?utf-8?B?RzFQY3paVVVsRkEvOEU5R2lERUgxMWtrd1p2ZWNOVzBoK0UwTVRxWUlvREpM?=
 =?utf-8?B?ZkdXQTJqN0Q4akI2YUZPRzAxa2lDQXp2Skl1TUxjZnJoRFpSMzZyVG83NlBB?=
 =?utf-8?B?UG1ZMmNsY2E0eFAvWUJrTFVZVjNZTW5hdlNjbnliSmJndzJxNytGQW9GK1BY?=
 =?utf-8?B?eEpKZEpJMlprKzQxVEpVZVdxbUgrT2tKM1ZjVkk2M29RUGRHemZDM2RkUmx4?=
 =?utf-8?B?dEhIcDZlL2hEMmNRYVJlbXJ2OXFSRXZiNUZSUFhoZ3RLM0J3Nk0zUlJ6U0pP?=
 =?utf-8?B?Sm9aS2Vwc09RMm1iUWtTY2JVR1M5Vi85c2hsZzRySDN1TlE0ZG5ncGo3dFFU?=
 =?utf-8?B?SzFON29NUUg1UThqaFpsalN0TW9hdlBmeVpJSEpNQkdWNU1tVXc3NllFSXFu?=
 =?utf-8?B?Tm15QjIzcjVvQXoxNHQyQlJzaThNOXVyUVNrNkhUTW9mVXVFM2wwNEtTZ3kv?=
 =?utf-8?B?UUFvNWNGSUdmbU9DNVBuejF2K0lMaWNUUFFTdWFrYi9lOUxsUG1WVVJMK290?=
 =?utf-8?B?ZHQxZzhCYjh4cTUxT05lL1N3Uml6bUhkSUFmR09ieTQzMVRLSVJyQkNOK1ZX?=
 =?utf-8?B?UzJoem02anlKZlhidm1pbUxVZ2ptUGdvTEM1dUQ2REhiRVpLR2tNaDhRNFZO?=
 =?utf-8?B?aWx3VHAvUWY2aGpNOUhNQVBBUkVmdTRPdThrOEdWUzFjaXBLdkpDVzhqKzUr?=
 =?utf-8?B?Z2U3bklhcXRSelBRQS9adE1pSk1aYUdIcjFjc2JxbDNVdXNFcXZKc2hCNWcw?=
 =?utf-8?B?MGNtbWlNUWgvSzFnQ2ZOenBXcGVRTmlIVGovQWw3d2Y4OUN1YzQ4ZTlxZlBr?=
 =?utf-8?B?cTFoRlU2NHc4TFAvZU15OXBWcHJ5YUdxbDdIczVnRCtkM3d5MTBSTFNDWDVO?=
 =?utf-8?B?b0VDOWhsRlB1TmpXZURpZDRidSthVVVZSUg2c0RxWFNhTTBoTGthb01XeTY4?=
 =?utf-8?B?c29xbndxMmZPTXFqQjNwZjBiWHAwYmRhN1RmeHVUSzc2VXBTVXZORWdZSDNT?=
 =?utf-8?B?dGhGVzlONkVKa1o4UFcwWXRhM09RYjVSZ3dmaG4zUWVIdGRkWEVBOCtVcGRQ?=
 =?utf-8?Q?0hsg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5261.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7208475d-9a25-4b83-5c48-08db456cb092
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 09:08:52.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /h7vazrNDqQbnkN6cwHEzU5dALO1YDZf9UTePiY+Goh/J+hVDjEha0LUAsx2fXryoj46Y8O0Cc8nb8wnHbgJ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Hou, 
 Xiaomeng \(Matthew\)" <Xiaomeng.Hou@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAyNSwgMjAyMyA0OjU0IFBN
DQo+IFRvOiBYaWFvLCBTaGFuZSA8c2hhbmUueGlhb0BhbWQuY29tPjsgQWxleCBEZXVjaGVyDQo+
IDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERldWNo
ZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFpoYW5nLCBIYXdr
aW5nDQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+OyBIb3UsDQo+IFhpYW9tZW5nIChNYXR0aGV3KSA8WGlhb21lbmcuSG91
QGFtZC5jb20+OyBMaXUsIEFhcm9uDQo+IDxBYXJvbi5MaXVAYW1kLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRW5hYmxlIGRvb3JiZWxsIHNlbGZyaW5nIGlmIHJlc2l6
ZSBCQVINCj4gc3VjY2Vzc2Z1bGx5DQo+IA0KPiANCj4gDQo+IEFtIDI1LjA0LjIzIHVtIDA1OjI5
IHNjaHJpZWIgWGlhbywgU2hhbmU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVy
YWxdDQo+ID4NCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5
LCBBcHJpbCAyNSwgMjAyMyA5OjE0IEFNDQo+ID4+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+ID4+IDxDaHJpc3RpYW4uS29lbmln
QGFtZC5jb20+DQo+ID4+IENjOiBYaWFvLCBTaGFuZSA8c2hhbmUueGlhb0BhbWQuY29tPjsgQ2hy
aXN0aWFuIEvDtm5pZw0KPiA+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+OyBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4gRGV1Y2hlciwgQWxleGFuZGVyIDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcNCj4gPj4gPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47
DQo+ID4+IEhvdSwgWGlhb21lbmcgKE1hdHRoZXcpIDxYaWFvbWVuZy5Ib3VAYW1kLmNvbT4NCj4g
Pj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRW5hYmxlIGRvb3JiZWxsIHNlbGZy
aW5nIGlmIHJlc2l6ZQ0KPiA+PiBCQVIgc3VjY2Vzc2Z1bGx5DQo+ID4+DQo+ID4+IFtBTUQgT2Zm
aWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPiA+Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4+IEZyb206IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29t
Pg0KPiA+Pj4gU2VudDogVHVlc2RheSwgQXByaWwgMjUsIDIwMjMgNDoyMCBBTQ0KPiA+Pj4gVG86
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+ID4+PiBDYzog
WGlhbywgU2hhbmUgPHNoYW5lLnhpYW9AYW1kLmNvbT47IENocmlzdGlhbiBLw7ZuaWcNCj4gPj4+
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOw0KPiA+Pj4gRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgWmhhbmcsIEhhd2tpbmcNCj4gPj4+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBL
dWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ow0KPiA+Pj4gSG91LCBYaWFv
bWVuZyAoTWF0dGhldykgPFhpYW9tZW5nLkhvdUBhbWQuY29tPjsgTGl1LCBBYXJvbg0KPiA+Pj4g
PEFhcm9uLkxpdUBhbWQuY29tPg0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdw
dTogRW5hYmxlIGRvb3JiZWxsIHNlbGZyaW5nIGlmIHJlc2l6ZQ0KPiA+Pj4gQkFSIHN1Y2Nlc3Nm
dWxseQ0KPiA+Pj4NCj4gPj4+IE9uIE1vbiwgQXByIDI0LCAyMDIzIGF0IDM6MTHigK9QTSBDaHJp
c3RpYW4gS8O2bmlnDQo+ID4+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiA+Pj4gd3Jv
dGU6DQo+ID4+Pj4gQW0gMjQuMDQuMjMgdW0gMTY6MDYgc2NocmllYiBYaWFvLCBTaGFuZToNCj4g
Pj4+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQo+ID4+Pj4+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogWGlhbywgU2hhbmUNCj4gPj4+Pj4+
IFNlbnQ6IE1vbmRheSwgQXByaWwgMjQsIDIwMjMgNjozMSBQTQ0KPiA+Pj4+Pj4gVG86IENocmlz
dGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPjsgYW1kLQ0KPiA+
Pj4+Pj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+ID4+
Pj4+PiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nDQo+ID4+Pj4+
PiA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4DQo+IDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KPiA+Pj4+Pj4gQ2M6IEhvdSwgWGlhb21lbmcgKE1hdHRoZXcpIDxYaWFv
bWVuZy5Ib3VAYW1kLmNvbT47IExpdSwgQWFyb24NCj4gPj4+Pj4+IDxBYXJvbi5MaXVAYW1kLmNv
bT4NCj4gPj4+Pj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IEVuYWJsZSBkb29y
YmVsbCBzZWxmcmluZyBpZg0KPiA+Pj4+Pj4gcmVzaXplIEJBUiBzdWNjZXNzZnVsbHkNCj4gPj4+
Pj4+DQo+ID4+Pj4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gPj4+Pj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4+IEZyb206IENocmlzdGlhbiBL
w7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiA+Pj4+Pj4+IFNlbnQ6
IE1vbmRheSwgQXByaWwgMjQsIDIwMjMgNTowNyBQTQ0KPiA+Pj4+Pj4+IFRvOiBYaWFvLCBTaGFu
ZSA8c2hhbmUueGlhb0BhbWQuY29tPjsNCj4gPj4+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+ID4+Pj4+Pj4gPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBaaGFuZywgSGF3a2luZw0KPiA+Pj4+Pj4+IDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+OyBLdWVobGluZywgRmVsaXgNCj4gPj4+Pj4+PiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4N
Cj4gPj4+Pj4+PiBDYzogSG91LCBYaWFvbWVuZyAoTWF0dGhldykgPFhpYW9tZW5nLkhvdUBhbWQu
Y29tPjsgTGl1LA0KPiBBYXJvbg0KPiA+Pj4+Pj4+IDxBYXJvbi5MaXVAYW1kLmNvbT4NCj4gPj4+
Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBFbmFibGUgZG9vcmJlbGwgc2Vs
ZnJpbmcgaWYNCj4gPj4+Pj4+PiByZXNpemUgQkFSIHN1Y2Nlc3NmdWxseQ0KPiA+Pj4+Pj4+DQo+
ID4+Pj4+Pj4gQW0gMTguMDQuMjMgdW0gMDg6NTQgc2NocmllYiBTaGFuZSBYaWFvOg0KPiA+Pj4+
Pj4+PiBbV2h5XQ0KPiA+Pj4+Pj4+PiBUaGUgc2VsZnJpbmcgZG9vcmJlbGwgYXBlcnR1cmUgd2ls
bCBjaGFuZ2Ugd2hlbiB3ZSByZXNpemUgRkINCj4gPj4+Pj4+Pj4gQkFSIHN1Y2Nlc3NmdWxseSBk
dXJpbmcgZ21jIHN3IGluaXQsIHdlIHNob3VsZCByZW9yZGVyIHRoZQ0KPiA+Pj4+Pj4+PiBzZXF1
ZW5jZSBvZiBlbmFibGluZyBkb29yYmVsbCBzZWxmcmluZyBhcGVydHVyZS4NCj4gPj4+Pj4+PiBU
aGF0J3MgYSBnb29kIGNhdGNoLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFtIb3ddDQo+ID4+Pj4+
Pj4+IE1vdmUgZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlIGZyb20gKl9jb21tb25f
aHdfaW5pdA0KPiB0bw0KPiA+Pj4+Pj4+PiAqX2NvbW1vbl9sYXRlX2luaXQuDQo+ID4+Pj4+Pj4g
QnV0IHRoYXQgc291bmRzIGxpa2UgYSBiYWQgaWRlYS4gSW5zdGVhZCB0aGUgZnVsbCBjYWxsIHRv
DQo+ID4+Pj4+Pj4gbnZfZW5hYmxlX2Rvb3JiZWxsX2FwZXJ0dXJlKCkgc2hvdWxkIGJlIG1vdmVk
IGFyb3VuZC4NCj4gPj4+Pj4+IEhpIENocmlzdGlhbiwNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBZZXMs
ICBJIGdldCB5b3VyIGlkZWEuIEJ1dCBhcyBmYXIgYXMgSSBjYW4gdW5kZXJzdGFuZCB0aGF0LCB0
aGUNCj4gPj4+Pj4+IGdmeCBodyBpbml0IHdpbGwgdXNlIGRvb3JiZWxsLg0KPiA+Pj4+Pj4gSWYg
c28sIHdlIGNhbm5vdCBlbmFibGUgZG9vcmJlbGwgYWZ0ZXIgZ2Z4IGh3IGluaXQuDQo+ID4+Pj4+
IFdlIGhhdmUgY29tZSB1cCB3aXRoIHR3byB3YXlzIHRvIHJlc29sdmUgdGhlIGlzc3VlLg0KPiA+
Pj4+Pg0KPiA+Pj4+PiAxKSBTZXBhcmF0ZSBlbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUgYW5kDQo+
ID4+Pj4+IGVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZS4gSG93ZXZlciwgIHRoZQ0K
PiA+Pj4gZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlIHNob3VsZCBiZSBtb3ZlZCBp
bg0KPiA+Pj4gKl9jb21tb25faXBfZnVuY3MtDQo+ID4+Pj4gbGF0ZV9pbml0Lg0KPiA+Pj4+DQo+
ID4+Pj4gSSdtIG5vdCBhbiBleHBlcnQgZm9yIHRoaXMgcGFydCBvZiB0aGUgZHJpdmVyLCBidXQg
b2YgaGFuZCB0aGF0DQo+ID4+Pj4gc291bmRzIGxpa2UgdGhlIHJpZ2h0IHdheSBvZiBkb2luZyBp
dC4NCj4gPj4+Pg0KPiA+Pj4+IEFsZXggYW55IG9iamVjdGlvbnM/DQo+ID4+PiBZZWFoLCBzZWVt
cyByZWFzb25hYmxlLg0KPiA+Pj4NCj4gPj4+IEFsZXgNCj4gPj4+DQo+ID4+IGVuYWJsZV9kb29y
YmVsbF9hcGVydHVyZSBhbmQgZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlIHNob3Vs
ZA0KPiA+PiBiZSBpbiBjb21tb25fKl9pbml0IGluc3RlYWQgb2YgZ21jX2h3X2luaXQuDQo+ID4+
IFRoZSBvcmRlciBvZiBleGVjdXRpb24gb2YgU2hhbmUncyAxc3Qgd2F5IGlzIDoNCj4gPj4gMSkg
Y29tbW9uX3N3X2luaXQNCj4gPj4gMikgY29tbW9uX2h3X2luaXQgIC0+IGVuYWJsZV9kb29yYmVs
bF9hcGVydHVyZQ0KPiA+PiAzKSBnbWNfc3dfaW5pdCAtPiBhbWRncHVfZGV2aWNlX3Jlc2l6ZV9m
Yl9iYXIgICAgICAgICAgICAgICAgICAvLy9UaGlzIHJlbGllcw0KPiA+PiBnbWMucmVhbF92cmFt
X3NpemUgdG8gZGV0ZXJtaW5lIHJlc2l6ZV9mYl9iYXIsIHNvIG1vdmluZw0KPiA+PiBhbWRncHVf
ZGV2aWNlX3Jlc2l6ZV9mYl9iYXIgdG8gY29tbW9uX3N3X2luaXQgIGlzIG5vdCBhIGdvb2QgaWRl
YS4NCj4gPj4gNCkgZ21jX2h3X2luaXQNCj4gPj4gNSkgY29tbW9uX2xhdGVfaW5pdCAtPiBlbmFi
bGVfZG9vcmJlbGxfc2VsZnJpbmdfYXBlcnR1cmUNCj4gPj4NCj4gPj4gVGhlIDFzdCB3YXkgbG9v
a3MgZ29vZCB0byBtZSBhbmQgcmV2aWV3ZWQtYnkgbWUuDQo+ID4gSGkgQWxleCAmIENocmlzdGlh
biwNCj4gPg0KPiA+IFNpbmNlIHRoaXMgcGF0Y2ggaGFzIGFscmVhZHkgaW1wbGVtZW50ZWQgaXQg
aW4gdGhpcyB3YXksIGlzIHRoZXJlIGFueSBvdGhlcg0KPiBjb21tZW50cyBvbiB0aGlzIHBhdGNo
IGJvZHk/DQo+ID4gT3IgY2FuIEkgYWRkIHlvdSBSLUIgb3IgQWNrZWQtYnkgb24gdGhpcyBwYXRj
aD8NCj4gDQo+IEF0IGxlYXN0IHJlbW92ZSB0aGUgZnVuY3Rpb25zDQo+IHNvYzE1X2VuYWJsZV9k
b29yYmVsbF9hcGVydHVyZSgpL252X2VuYWJsZV9kb29yYmVsbF9hcGVydHVyZSgpL3NvYzIxX2Vu
YWINCj4gbGVfZG9vcmJlbGxfYXBlcnR1cmUoKQ0KPiBhbmQgb3BlbiBjb2RlIHRoZSByZXNwZWN0
aXZlIGNhbGxzLg0KPiANCj4gVGhvc2UgZG9uJ3QgbWFrZSBzZW5zZSBhbnkgbW9yZSBzaW5jZSB3
ZSBkb24ndCBoYXZlIGEgY2VudHJhbCBwb2ludCB3aGVuIHRoZQ0KPiBhcGVydHVyZXMgYXJlIGVu
YWJsZWQvZGlzYWJsZWQuDQoNClN1cmUsIEkgd2lsbCB1cGRhdGUgdGhpcyBpbiB2Mi4NCg0KQmVz
dCBSZWdhcmRzLA0KU2hhbmUNCg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4g
Pg0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBTaGFuZQ0KPiA+DQo+ID4+Pj4gUmVnYXJkcywNCj4g
Pj4+PiBDaHJpc3RpYW4uDQo+ID4+Pj4NCj4gPj4+Pj4gMikgVGhlIGZ1bGwgY2FsbCBjYW4gYmUg
bW92ZWQgdG8gZ21jIGh3IGluaXQuICBCdXQgaXQgc2VlbXMNCj4gPj4+Pj4gc3RyYW5nZSB0byBt
b3ZlDQo+ID4+PiBuYmlvIGNvbmZpZ3VyYXRpb24gaW50byBnbWMgaHcgaW5pdC4NCj4gPj4+Pj4g
SWYgbmVpdGhlciBvZiB0aGUgYWJvdmUgbWV0aG9kcyBpcyBzdWl0YWJsZSwgY291bGQgeW91IHBs
ZWFzZSBnaXZlDQo+ID4+Pj4+IHVzIHNvbWUNCj4gPj4+IGFkdmljZSBvbiB0aGlzIGlzc3VlPw0K
PiA+Pj4+PiBCZXN0IFJlZ2FyZHMsDQo+ID4+Pj4+IFNoYW5lDQo+ID4+Pj4+DQo+ID4+Pj4+PiBC
ZXN0IFJlZ2FyZHMsDQo+ID4+Pj4+PiBTaGFuZQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+PiBSZWdhcmRz
LA0KPiA+Pj4+Pj4+IENocmlzdGlhbi4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBUaGlzIGZpeGVz
IHRoZSBwb3RlbnRpYWwgaXNzdWUgdGhhdCBHUFUgcmluZyBpdHMgb3duIGRvb3JiZWxsDQo+ID4+
Pj4+Pj4+IHdoZW4gdGhpcyBkZXZpY2UgaXMgaW4gdHJhbnNsYXRlZCBtb2RlIHdpdGggaW9tbXUg
aXMgb24uDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNoYW5lIFhpYW8g
PHNoYW5lLnhpYW9AYW1kLmNvbT4NCj4gPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1
IDxhYXJvbi5saXVAYW1kLmNvbT4NCj4gPj4+Pj4+Pj4gVGVzdGVkLWJ5OiBYaWFvbWVuZyBIb3Ug
PFhpYW9tZW5nLkhvdUBhbWQuY29tPg0KPiA+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4gICAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgICAgfCA0ICsrKy0NCj4gPj4+Pj4+Pj4gICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA0ICsrKy0NCj4gPj4+Pj4+Pj4g
ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzIxLmMgfCA0ICsrKy0NCj4gPj4+Pj4+
Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYw0KPiA+Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMg
aW5kZXgNCj4gPj4+Pj4+Pj4gNDc0MjBiNDAzODcxLi5mNGM4NTYzNGE0YzgNCj4gPj4+Pj4+Pj4g
MTAwNjQ0DQo+ID4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMN
Cj4gPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYw0KPiA+Pj4+
Pj4+PiBAQCAtNTM1LDcgKzUzNSw4IEBAIHN0YXRpYyB2b2lkDQo+ID4+Pj4+Pj4+IG52X2VuYWJs
ZV9kb29yYmVsbF9hcGVydHVyZShzdHJ1Y3QNCj4gPj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2
LA0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgZW5hYmxlKQ0KPiA+Pj4+Pj4+PiAgICAgew0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICBh
ZGV2LT5uYmlvLmZ1bmNzLT5lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoYWRldiwNCj4gPj4+Pj4+
Pj4gZW5hYmxlKTsNCj4gPj4+Pj4+Pj4gLSAgYWRldi0+bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3Ji
ZWxsX3NlbGZyaW5nX2FwZXJ0dXJlKGFkZXYsDQo+ID4+Pj4+Pj4+IGVuYWJsZSk7DQo+ID4+Pj4+
Pj4+ICsgIGlmICghZW5hYmxlKQ0KPiA+Pj4+Pj4+PiArDQo+ID4+Pj4+Pj4+ICsgYWRldi0+bmJp
by5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlKGFkZXYsDQo+ID4+Pj4+
Pj4gZmFsc2UpOw0KPiA+Pj4+Pj4+PiAgICAgfQ0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiAgICAg
Y29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIG52X2NvbW1vbl9pcF9ibG9jayA9
DQo+ID4+Pj4+Pj4+IEBADQo+ID4+Pj4+Pj4+IC05OTksNg0KPiA+Pj4+Pj4+PiArMTAwMCw3IEBA
IHN0YXRpYyBpbnQgbnZfY29tbW9uX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpDQo+ID4+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICB9DQo+ID4+Pj4+
Pj4+DQo+ID4+Pj4+Pj4+ICsgIGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9zZWxm
cmluZ19hcGVydHVyZShhZGV2LA0KPiA+Pj4+Pj4+PiArIHRydWUpOw0KPiA+Pj4+Pj4+PiAgICAg
ICAgICAgICByZXR1cm4gMDsNCj4gPj4+Pj4+Pj4gICAgIH0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gPj4+
Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ID4+Pj4+Pj4+IGlu
ZGV4IGJjNWRkODBmMTBjMS4uMDIwMmRlNzlhMzg5IDEwMDY0NA0KPiA+Pj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ID4+Pj4+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gPj4+Pj4+Pj4gQEAgLTYyMyw3ICs2MjMs
OCBAQCBzdGF0aWMgdm9pZA0KPiA+Pj4+Pj4+PiBzb2MxNV9lbmFibGVfZG9vcmJlbGxfYXBlcnR1
cmUoc3RydWN0DQo+ID4+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSkN
Cj4gPj4+Pj4+Pj4gICAgIHsNCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgYWRldi0+bmJpby5mdW5j
cy0+ZW5hYmxlX2Rvb3JiZWxsX2FwZXJ0dXJlKGFkZXYsDQo+ID4+Pj4+Pj4+IGVuYWJsZSk7DQo+
ID4+Pj4+Pj4+IC0gIGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19h
cGVydHVyZShhZGV2LA0KPiA+Pj4+Pj4+PiBlbmFibGUpOw0KPiA+Pj4+Pj4+PiArICBpZiAoIWVu
YWJsZSkNCj4gPj4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+PiArIGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJs
ZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZShhZGV2LA0KPiA+Pj4+Pj4+IGZhbHNlKTsNCj4g
Pj4+Pj4+Pj4gICAgIH0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gICAgIGNvbnN0IHN0cnVjdCBh
bWRncHVfaXBfYmxvY2tfdmVyc2lvbiB2ZWdhMTBfY29tbW9uX2lwX2Jsb2NrDQo+ID4+Pj4+Pj4+
ID0gQEANCj4gPj4+Pj4+Pj4gLTExMjUsNiArMTEyNiw3IEBAIHN0YXRpYyBpbnQgc29jMTVfY29t
bW9uX2xhdGVfaW5pdCh2b2lkDQo+ICpoYW5kbGUpDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIGlm
IChhbWRncHVfc3Jpb3ZfdmYoYWRldikpDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
eGdwdV9haV9tYWlsYm94X2dldF9pcnEoYWRldik7DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+ICsg
IGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZShhZGV2
LA0KPiA+Pj4+Pj4+PiArIHRydWUpOw0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICByZXR1cm4gMDsN
Cj4gPj4+Pj4+Pj4gICAgIH0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzIxLmMNCj4gPj4+Pj4+Pj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MyMS5jDQo+ID4+Pj4+Pj4+IGluZGV4IDUxNGJmYzcwNWQ1YS4u
Y2Q0NjE5MDg1ZDY3IDEwMDY0NA0KPiA+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MyMS5jDQo+ID4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzIxLmMNCj4gPj4+Pj4+Pj4gQEAgLTQ1NCw3ICs0NTQsOCBAQCBzdGF0aWMgdm9pZA0K
PiA+Pj4+Pj4+PiBzb2MyMV9lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoc3RydWN0DQo+ID4+Pj4+
Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSkNCj4gPj4+Pj4+Pj4gICAgIHsNCj4g
Pj4+Pj4+Pj4gICAgICAgICAgICAgYWRldi0+bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2Fw
ZXJ0dXJlKGFkZXYsDQo+ID4+Pj4+Pj4+IGVuYWJsZSk7DQo+ID4+Pj4+Pj4+IC0gIGFkZXYtPm5i
aW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZShhZGV2LA0KPiA+Pj4+
Pj4+PiBlbmFibGUpOw0KPiA+Pj4+Pj4+PiArICBpZiAoIWVuYWJsZSkNCj4gPj4+Pj4+Pj4gKw0K
PiA+Pj4+Pj4+PiArIGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19h
cGVydHVyZShhZGV2LA0KPiA+Pj4+Pj4+IGZhbHNlKTsNCj4gPj4+Pj4+Pj4gICAgIH0NCj4gPj4+
Pj4+Pj4NCj4gPj4+Pj4+Pj4gICAgIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lv
biBzb2MyMV9jb21tb25faXBfYmxvY2sNCj4gPj4+Pj4+Pj4gPSBAQA0KPiA+Pj4+Pj4+PiAtNzY0
LDYgKzc2NSw3IEBAIHN0YXRpYyBpbnQgc29jMjFfY29tbW9uX2xhdGVfaW5pdCh2b2lkICpoYW5k
bGUpDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfaXJxX2dl
dChhZGV2LCAmYWRldi0NCj4gPj4+Pj4+Pj4gbmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwg
MCk7DQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIH0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gKyAg
YWRldi0+bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlKGFkZXYs
DQo+ID4+Pj4+Pj4+ICsgdHJ1ZSk7DQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIHJldHVybiAwOw0K
PiA+Pj4+Pj4+PiAgICAgfQ0KPiA+Pj4+Pj4+Pg0K
