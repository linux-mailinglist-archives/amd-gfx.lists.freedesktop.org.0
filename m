Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E165E59188E
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Aug 2022 06:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1890B7D56;
	Sat, 13 Aug 2022 04:17:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE35B7D44
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Aug 2022 04:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUfkK8slHFdylvaBm/7GfUJG4UWNeWhjtWMd/THS9QUvcpaRwNIkidxRnoVzXe2VNPRC79LoH2qeyRFhyrV9QfIZnI/Ku6jUO3qfjCF9Bd4EWvxg1TDp9xaawK8CVgHRntUHV/pHNbmGnsxyAugrekugZil5fiTnodLEoPrR/5XfcjTXyJdYyVNV9KaoA8lkbzdu+faaZBpeUMwKmrxAKeMkJM2ZQWtPYRpt+d65EeUuc+Ek5Ae7t2ltsJAK5QR4+S4d/Jgt5WzIkIF67qdPFQkRWc4Xzs4ZRADqYsWQjT1o/cxoUXtyRfhFdtCwG678LnzlHqnuFSTfzZIccP/r2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjcbGt8vKGCuk1HLgBmGDslgmkT1xp7+MFm7nL0BS4Q=;
 b=A67sQw4Erztulwc0nQ0AzrXA0rlZ4QiTDbpZ9r2wxEyoASMow89SkOkXpEwbxOYexKNHXD7N2csv9d7jTz1ZxJfhr7hBQV739U4iOWCZsw0PzTcpVuMkszvxVB1jBZCY4Q8yMPQziQ/hMGCZxTV3pQvpaTqiMa/GPRI6HznddF01RWCB0BV9AajWdGoXgtf2nbEYj/Ro5S3xtYSggb3RgGVmhCPtoNSiKb3sh73JwewuUEUu4kLU0SDAVha9r9hU3sd0c334RnDOAh2J+WW93Ay/Ytmsv6NigwlpSwmyIaYT2eokHDFcGOcT5hQn9uqhmwtDQaNb89uwwSnxDVOk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjcbGt8vKGCuk1HLgBmGDslgmkT1xp7+MFm7nL0BS4Q=;
 b=WZAZi6+z4HWDR6ARzCGXIm4A2hMhI4dgfDm/3RhOWsXgU05Mm0u+xsaUWcaZNZsbeo8JSggGdIvtAxHuG3Nksib5eo6O8VDg0a7e1msM2oTvcaq9NGnDK82JqHpUIj4Fyueqe4xJdLPW1NnyMD/vPXPQAnnAXqDwOJvR+cFY5Xw=
Received: from DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) by
 BYAPR12MB3384.namprd12.prod.outlook.com (2603:10b6:a03:d8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Sat, 13 Aug 2022 04:16:59 +0000
Received: from DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::207d:4364:5b65:b484]) by DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::207d:4364:5b65:b484%4]) with mapi id 15.20.5525.011; Sat, 13 Aug 2022
 04:16:59 +0000
From: "Zhu, Jiadong" <Jiadong.Zhu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: modify mcbp implement for gfx9(v3)
Thread-Topic: [PATCH] drm/amdgpu: modify mcbp implement for gfx9(v3)
Thread-Index: AQHYrTFRdf8hYEwIOUKfn0tjQLhwya2rJe8AgAEBReA=
Date: Sat, 13 Aug 2022 04:16:59 +0000
Message-ID: <DS7PR12MB63334067BBEC385A32710E66F4669@DS7PR12MB6333.namprd12.prod.outlook.com>
References: <20220811031953.963227-1-Jiadong.Zhu@amd.com>
 <a8d38251-92ab-17ce-a3cd-c68fb7cb3ff7@gmail.com>
In-Reply-To: <a8d38251-92ab-17ce-a3cd-c68fb7cb3ff7@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=dc9a0095-d008-4c12-aa14-3584fcbd5299;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-13T03:00:07Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcd1a24b-17fe-47a1-cf36-08da7ce2aaa5
x-ms-traffictypediagnostic: BYAPR12MB3384:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QrvtSv4zuYDX+uyJJzNC0BnfWorAYu1E/s/tlxsjEUijw9lYGe0ptt+kAAZ76J8XJoADZ0CpW6XFMkVpmXUEpkuJkgtCQXzlSn1TaZu84+rfgdVBRxXwcpYhprgJqfKpmpFB0fl89Rlc2rWtKHu9xAi5JHOsHVOI80Vvrsl2yWx19qdLh3XRx/i6o3uUIGSRkjWvLF/dXKgpBZPgwDx71SWB92RNca/SlmqK/e9OyRnHJxCDaca/1SnWwOV1iKY0ikEsN7EInfmjbK17oGAhZ7eFQsLG65Ts9UifYsblagA/D1JAgGHng8Dp1uNt1rKpO556CFQI2sf5u70nK+NWc4qy/ZD2L/dBtnNXUOluuZsjjos6nkzX95tlh9/SLkxlKyadgZq/sfzvvqImgHdDdOt4nK8CNuCLHmC0eS1jDqbE9ZpB8fgFEPpqveAB8sCfcH9klHd0DC06/0bbZLhdWevF6rKaeO0J/HeVIjWUmZ9z6ql3Z88LfyU8HI9IAIgIg8jnztT04tCtKrr0dSvG5vkLhSX//hHVwyXthKsXCXmK67g1m/KdUFLGrurRc/76lz0j3+FMQnmkzMNw9bDSsot3oWiYYqoMbc05g1UYdDYnnngffQnwmKtRTQEpdjRwFnqp35a083Rzq6R9+ia44OrYZ6mZewELqsZITYyfrGnNHWLUwdfXcwBVuNw28lU6Y+/vA+2aorQw7yfX+NelSdtUr1tagylI716nT1eUFy0UbtWbObhKAiEEG8Gz/XXC/zQ2O9SNBUfkPgT+ernoRPLtC5rDqyLT2Sv44gE67q/vVW1moQi2N9JYVIMP/0cI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6333.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(316002)(38100700002)(64756008)(8676002)(66556008)(4326008)(83380400001)(478600001)(54906003)(66446008)(76116006)(110136005)(66946007)(26005)(30864003)(86362001)(55016003)(33656002)(2906002)(5660300002)(52536014)(8936002)(9686003)(6506007)(41300700001)(71200400001)(122000001)(7696005)(66574015)(38070700005)(66476007)(53546011)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGhVb3dzZ2hzL1pRM2diWHh6SklWaC8wVTJjMktGazBBNG8zbmx4QWVOSktT?=
 =?utf-8?B?K0tJek1BUzY1dHJJVFhqY0UvdW9pbEpacWpOUGNJMXo4RU1CMmY4bFhpdWlX?=
 =?utf-8?B?Ym9GUmhYR2xDV0FSVkNIWDlTM0JWN3p1WHpwaVFlRW1vRUJJa0VoSG02cnJU?=
 =?utf-8?B?Tmd6WnFLUjUvT1dxUGRha01HTEZaWkU4UUJnQkpOdUNZTGpVOXVkbVp2d2x4?=
 =?utf-8?B?Qm9WQWF4V2Q5WFh1UDdoRXNQMlZjbDQzSnhQZ1l2WVE2Zm9FVm5GL2dHSmdH?=
 =?utf-8?B?bERSWUFzVjZSWVl2WlRJUzNvQ2ppYnlCTm9qRXpCdys4RTRBNUplNWpPNUxN?=
 =?utf-8?B?ek5OaGVVOEZ2M1dJaG9wa2hBV1A2Z2g1Q1puTWhKRjdlbmFYOTk4VFMxZXRy?=
 =?utf-8?B?QjJaK3JJV2FtVlVDcnVqMXhqcDQ1ZkFuNmJKeHpXNEN0dWNSVHlBREpEam1R?=
 =?utf-8?B?Z3R5UlZXV2R4SG1JNCtWWWYrcExlZzQyZjNMRmZiYS8yYXI2U05mQTV5Q01F?=
 =?utf-8?B?UFhWK203RlNpM1NibmxPRTNDbUYrY2lWTlc4UGFzaXUzaHFqV2tTZmtmaU1r?=
 =?utf-8?B?SlhHVllncmphSHFwVjZpTGN4VGVaWHhuM09jZXl4RWMwdHp2aVNmU0pkT3Y3?=
 =?utf-8?B?Si9pMVVzL21NYWhQUnRyWVZ6UElsdTRFUnlsWTNJeVhudHcvZEM3YmpzSEda?=
 =?utf-8?B?QzZLZTN3WEV1Z3VCQ2lHSkJCcG9tR2hTaGJ4WHYvc1FKblBVTmxGdkFPSVRF?=
 =?utf-8?B?OUxrcXZ4V2xUY0xzRUwydGNvSHl3cWZEdzVPR1ZVcmNGY05iYzlQSW9LelZT?=
 =?utf-8?B?QjFIRmEwT2xGSEtwTDlNZkRMalA0eXhsd0J4T0x1MXRFOUptVU9lV1h0bnBX?=
 =?utf-8?B?Z0FhVHdDODhXeXAvU2x1UXZQcXBnTUMrdHpLaFpzL1dYZVN5TG1zZExtRlBW?=
 =?utf-8?B?UXJKN3ZTNkd5dHRBdktoWERVMkQwSW85ZmpLM2ZVUmFkSWNmQ0xpeFE1eDRi?=
 =?utf-8?B?SmtlKzkzTm10ZzhNRGJ4NUZoRUdydFgvNzFRWWdRWGNpZXJuWWs3U0dlU3BG?=
 =?utf-8?B?Tnp2Q282S1BiakJvOUxuZHQxKzBYbVE5UGZwYytnb0w3Szk5TFN5Qm1kSmdW?=
 =?utf-8?B?L1pkUFNzTXpLcFZYTkVrVXhWSXVCZEwrRi9MRmlQMUp1ejB1VU9xQjRka253?=
 =?utf-8?B?ektGSHJla1FPQWIwZ3JITk94R1hpciszS2NGblpCd0ZzS2J1S3BqMWFjc2hO?=
 =?utf-8?B?UTBsOGR6ZWI5alpzK0JwTGRvWXdoSS9scXlsUythOXhiZ2RFc3A2alB4Sk5Q?=
 =?utf-8?B?UjhTVk5pOExjWXZYa2hUclpjVmpoTGJZUlY1YWVxQngwRFA1aVJhb1dFV0hx?=
 =?utf-8?B?ZXNHVkFTbWZxK0Q2SVZrZkR1SmVQT0FWR3NnSlQxV3J6aFF4TkErUVQxREJu?=
 =?utf-8?B?N3FsQTVQelhQanVGQksrM0grRHIxajdDcy9NaDRNODlDVXdTV0t2ZDJvN01J?=
 =?utf-8?B?V3VTRzdsWFB2NmlmK3lXTmVvZUV2VTFzSCt5R2RsS2UwWUdFTXJycGY5VWZU?=
 =?utf-8?B?b0VFWmdFZnIwNFRjZkl5cFpDaHQ2L2ZrMk5lOTJibVlEMW92eEVKVkkvMkVP?=
 =?utf-8?B?UTI5WXZIVjU0SjZjQzYvZVFmYU96aU9JSUcwaWtKaVBXUG1VK01MWWtzdm95?=
 =?utf-8?B?cGpwcXpTYWtUN0ozQkNWTnlLeHlNQjV4c293NnhPWkF0L2d1T2MvTnF2Zkxn?=
 =?utf-8?B?amtGcFZwSXlMWVp3OTZzVzZoelIxWFFiVjU2bzJGVU5xMjMrVzQrcjNIUHVh?=
 =?utf-8?B?b2hlWkYzaDJ5K1Z2T2E1aS9yS2ZDaVZyalBQRXJweXUzQzAzWVp0Njk4N3RV?=
 =?utf-8?B?Y0ptT0NjOW1FTnlBcGNtZk11NEdBRHdLYk9CZCtNazVZcFQwWVZqTU5aR05t?=
 =?utf-8?B?VjZvVnlGVE4rOWxiTWhJUGpIbC9ldnhUczl5UzFsMWFBSm1XTjBQaC9CZE5r?=
 =?utf-8?B?S0Y5SzFQT0hnNnFyQm05cm80bWJvOFowKzlWL2p0M0VQejVyM2swNDNOTUov?=
 =?utf-8?B?Mm9WelI5QlNqTVFxUmNkWnpmeWxoMzZIOHgrSDFBN2gyeVdNdmN4SXg1TlNL?=
 =?utf-8?Q?1OPQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6333.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd1a24b-17fe-47a1-cf36-08da7ce2aaa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2022 04:16:59.3636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJWxjGnpdRN5QNreLSt8bmQN1w3vPPV0gHrVYXqSh1QG9uP97jU4rf/lqO5jKwQ1I/UV++gK79zI7VYyO3ls2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3384
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIENocmlzdGlhbiwNCg0KVGhl
IGRldGFpbHMgYXMgZm9sbG93czoNCg0KPiAxLiBVc2UgdW5tYXBfcXVldWUgcGFja2FnZSB0byB0
cmlnZ2VyIHByZWVtcHRpb24gb24gZ2Z4OQ0KPiAgICAgQWRkIHRyYWlsaW5nIGZlbmNlIHRvIHRy
YWNrIHRoZSBwcmVlbXB0aW9uIGRvbmUuDQoNCk9uIGdmeDksIHRoZXJlIGlzIG5vIHNpbmdsZSBw
YWNrYWdlIHRvIGNvbXBsZXRlIHRoZSBtY2JwIHJlcXVlc3QgaW4gYSBzaW5nbGUgZnJhbWUgbGlr
ZSBnZngxMCBkb2VzLg0KVG8gc2VuZCBwcmVlbXB0aW9uIG9uIGdmeDksIGttZCBuZWVkcyB0bzoN
CjEuIGVtaXQgYSB0cmFpbGluZyBmZW5jZSBvbiBnZnggcmluZywgZG8gbm90IHVwZGF0ZSB0aGUg
d3B0ciB0byBjcC4NCjIuIGVtaXQgYSB3cml0ZV9yZWcgdG8gcmVzZXQgbW1DUF9WTUlEX1BSRUVN
UFQgYWZ0ZXIgdGhlIHRyYWlsaW5nIGZlbmNlLg0KMy4gc2VuZCB1bm1hcF9xdWV1ZSB0byBraXEg
cmluZyB3aXRoIGZpZWxkIHJiX3dwdHIgd2hpY2ggaXMgdGhlIG9mZnNldCBvZiB0cmFpbGluZyBm
ZW5jZSBvbiBnZnggcmluZy4NCg0KV2hlbiBjcCBmdyByZWNlaXZlcyB0aGUgdW5tYXBfcXVldWUg
aW4gbWVjLCBpdCB3aWxsOg0KMS4gU3RvcmUgbW1DUF9SQjBfV1BUUiBmcm9tIHJiX3dwdHIgdG8g
a2ljayBHRlggUkIgb2ZmLg0KMi4gd3JpdGUgbW1DUF9WTUlEX1BSRUVNUFQgYXMgMHhmZmZmIHRv
IHJlcXVlc3QgcHJlZW1wdGlvbiBvbiBhbGwgdm1pZHMuIFRoZW4gd2FpdCBvbiBtbUNQX1ZNSURf
UFJFRU1QVCB0byBiZWNvbWUgMHgwIGluZGljYXRpbmcgdGhlIHByZWVtcHRpb24gaXMgY29tcGxl
dGUuDQozLiB0aGUgcmVzdCBvZiBwaXBlbGluZSB3b3VsZCBkbyB0aGUgcHJlZW1wdGlvbiBhY2Nv
cmRpbmcgdG8gdGhlIG1tQ1BfVk1JRF9QUkVFTVBUIHVudGlsIGl0IGhpdHMgdGhlIHRyYWlsaW5n
IGZlbmNlLg0KNC4gYWZ0ZXIgdGhlIHRyYWlsaW5nIGZlbmNlIGlzIHNpZ25hbGVkLCAgdGhlIHdy
aXRlX3JlZyB0byByZXNldCBtbUNQX1ZNSURfUFJFRU1QVCB1bmJsb2NrcyB0aGUgdW5tYXBfcXVl
dWUgcGFja2FnZSB0byBwcm9jZWVkLg0KDQpUaGUgdW5tYXBfcXVldWUgb24gZ2Z4OSB1c2luZyBy
Yl93cHRyIGlzIHJlZmVycmVkIGZyb20gdGhlIGRvYyBjcF9wYWNrYWdlc19ybjoNClVOTUFQX1FV
RVVFUw0KRFd8IEJpdHMgfCBGaWVsZCAgfCBEZXNjcmlwdGlvbg0KNGIgfCAxOTowIHwgcmJfd3B0
ciB8IElmICgoZW5naW5lX3NlbCA9IDQpIGFuZCAoYWN0aW9uID0gMykpIHRoZW4gcHJlZW1wdGVk
IEdGWCBxdWV1ZeKAmXMgbmV3IFJCDQpwb2ludGVyLg0KDQoyLiBNb2RpZnkgZW1pdF9jZV9tZXRh
IGVtaXRfZGVfbWV0YSBmdW5jdGlvbnMNCj4gICAgIGZvciB0aGUgcmVzdW1lZCBpYnMuDQpGb3Ig
cHJlZW1wdGlvbiBlbmFibGVkIGlicywga21kIGFkZCBwcmVhbWJsZSBpYihjZS9kZSBtZXRhKSB0
byBpbml0aWFsaXplIGNzYSBkYXRhIGJlZm9yZSBzZW5kIHRoZSBtYWluIGliLiBUaGUgY3NhIGlz
IHVzZWQgdG8gc2F2ZS9yZXN0b3JlIGliIGV4ZWN1dGlvbiBpbmZvcyB3aGVuIHByZWVtcHRpb24v
cmVzdWJtaXQgaGFwcGVucy4NCktNRCBpcyByZXNwb25zaWJsZSB0byBleHRyYWN0IHRoZSBjb250
ZW50IGZyb20gQ1NBIGR1cmluZyByZS1zdWJtaXNzaW9uIG9mIGEgcHJldmlvdXNseSBwcmUtZW1w
dGVkIERNQSBmcmFtZS4NClRoZSBwYXRjaCBpcyB0byB3cml0ZSBjc2EgZGF0YSBmb3IgcmVzdWJt
aXQgaWJzIHdpdGggcHJldmlvdXMgcHJlZW1wdGVkIGliJ3MgY3NhLg0KDQpUaGFua3MsDQpKaWFk
b25nDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7Zu
aWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KU2VudDogRnJpZGF5LCBBdWd1
c3QgMTIsIDIwMjIgNzozOSBQTQ0KVG86IFpodSwgSmlhZG9uZyA8SmlhZG9uZy5aaHVAYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSHVhbmcsIFJheSA8UmF5Lkh1
YW5nQGFtZC5jb20+OyBMaXUsIEFhcm9uIDxBYXJvbi5MaXVAYW1kLmNvbT4NClN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWRncHU6IG1vZGlmeSBtY2JwIGltcGxlbWVudCBmb3IgZ2Z4OSh2MykN
Cg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpBbSAxMS4wOC4yMiB1bSAwNToxOSBzY2hy
aWViIGppYWRvbmcuemh1QGFtZC5jb206DQo+IEZyb206ICJKaWFkb25nLlpodSIgPEppYWRvbmcu
Wmh1QGFtZC5jb20+DQo+DQo+IDEuIFVzZSB1bm1hcF9xdWV1ZSBwYWNrYWdlIHRvIHRyaWdnZXIg
cHJlZW1wdGlvbiBvbiBnZng5DQo+ICAgICBBZGQgdHJhaWxpbmcgZmVuY2UgdG8gdHJhY2sgdGhl
IHByZWVtcHRpb24gZG9uZS4NCj4gMi4gTW9kaWZ5IGVtaXRfY2VfbWV0YSBlbWl0X2RlX21ldGEg
ZnVuY3Rpb25zDQo+ICAgICBmb3IgdGhlIHJlc3VtZWQgaWJzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKaWFkb25nLlpodSA8SmlhZG9uZy5aaHVAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICB8IDE2MSArKysrKysrKysrKysrKysrKysrKy0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1ZC5oICAgICAgfCAgIDIgKw0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
aA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgNCj4gaW5kZXgg
ODJjMTc4YTkwMzNhLi5jYTYyNmYwYWQ3YjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3JpbmcuaA0KPiBAQCAtNTksNiArNTksNyBAQCBlbnVtIGFtZGdwdV9yaW5n
X3ByaW9yaXR5X2xldmVsIHsNCj4gICAjZGVmaW5lIEFNREdQVV9GRU5DRV9GTEFHXzY0QklUICAg
ICAgICAgKDEgPDwgMCkNCj4gICAjZGVmaW5lIEFNREdQVV9GRU5DRV9GTEFHX0lOVCAgICAgICAg
ICAgKDEgPDwgMSkNCj4gICAjZGVmaW5lIEFNREdQVV9GRU5DRV9GTEFHX1RDX1dCX09OTFkgICAg
KDEgPDwgMikNCg0KPiArI2RlZmluZSBBTURHUFVfRkVOQ0VfRkxBR19FWEVDICAgICAgICAgICgx
IDw8IDMpDQoNCk9rLCB0aGF0IGhlcmUgbmVlZHMgbXVjaCBtb3JlIGV4cGxhbmF0aW9uIHdoeSB5
b3UgbmVlZCBpdCBhbmQgaG93IGFsbCB0aGlzIGlzIHN1cHBvc2VkIHRvIHdvcms/DQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gICAjZGVmaW5lIHRvX2FtZGdwdV9yaW5nKHMpIGNvbnRh
aW5lcl9vZigocyksIHN0cnVjdCBhbWRncHVfcmluZywNCj4gc2NoZWQpDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiBpbmRleCA1MzMyODk5NjQyZGMuLjg4NzAy
MWZkNTZhYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IEBA
IC03NTEsNyArNzUxLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfc2V0X3JsY19mdW5jcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgc3RhdGljIGludCBnZnhfdjlfMF9nZXRfY3Vf
aW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGFtZGdwdV9jdV9pbmZvICpjdV9pbmZvKTsNCj4gICBzdGF0aWMgdWlu
dDY0X3QgZ2Z4X3Y5XzBfZ2V0X2dwdV9jbG9ja19jb3VudGVyKHN0cnVjdCBhbWRncHVfZGV2aWNl
DQo+ICphZGV2KTsgLXN0YXRpYyB2b2lkIGdmeF92OV8wX3JpbmdfZW1pdF9kZV9tZXRhKHN0cnVj
dCBhbWRncHVfcmluZw0KPiAqcmluZyk7DQo+ICtzdGF0aWMgdm9pZCBnZnhfdjlfMF9yaW5nX2Vt
aXRfZGVfbWV0YShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGJvb2wNCj4gK3Jlc3VtZSk7DQo+
ICAgc3RhdGljIHU2NCBnZnhfdjlfMF9yaW5nX2dldF9ycHRyX2NvbXB1dGUoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nKTsNCj4gICBzdGF0aWMgdm9pZCBnZnhfdjlfMF9xdWVyeV9yYXNfZXJyb3Jf
Y291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKTsgQEANCj4gLTgyNCw5
ICs4MjQsMTAgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfa2lxX3VubWFwX3F1ZXVlcyhzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKmtpcV9yaW5nLA0KPg0KPiBQQUNLRVQzX1VOTUFQX1FVRVVFU19ET09SQkVM
TF9PRkZTRVQwKHJpbmctPmRvb3JiZWxsX2luZGV4KSk7DQo+DQo+ICAgICAgIGlmIChhY3Rpb24g
PT0gUFJFRU1QVF9RVUVVRVNfTk9fVU5NQVApIHsNCj4gLSAgICAgICAgICAgICBhbWRncHVfcmlu
Z193cml0ZShraXFfcmluZywgbG93ZXJfMzJfYml0cyhncHVfYWRkcikpOw0KPiAtICAgICAgICAg
ICAgIGFtZGdwdV9yaW5nX3dyaXRlKGtpcV9yaW5nLCB1cHBlcl8zMl9iaXRzKGdwdV9hZGRyKSk7
DQo+IC0gICAgICAgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUoa2lxX3JpbmcsIHNlcSk7DQo+ICsg
ICAgICAgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUoa2lxX3JpbmcsIGxvd2VyXzMyX2JpdHMocmlu
Zy0+d3B0ciAmIHJpbmctPmJ1Zl9tYXNrKSk7DQo+ICsgICAgICAgICAgICAgYW1kZ3B1X3Jpbmdf
d3JpdGUoa2lxX3JpbmcsIDApOw0KPiArICAgICAgICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKGtp
cV9yaW5nLCAwKTsNCj4gKw0KPiAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgIGFtZGdw
dV9yaW5nX3dyaXRlKGtpcV9yaW5nLCAwKTsNCj4gICAgICAgICAgICAgICBhbWRncHVfcmluZ193
cml0ZShraXFfcmluZywgMCk7IEBAIC01NDQ2LDExICs1NDQ3LDE2IEBADQo+IHN0YXRpYyB2b2lk
IGdmeF92OV8wX3JpbmdfZW1pdF9pYl9nZngoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0KPg0K
PiAgICAgICBjb250cm9sIHw9IGliLT5sZW5ndGhfZHcgfCAodm1pZCA8PCAyNCk7DQo+DQo+IC0g
ICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRldikgJiYgKGliLT5mbGFncyAmIEFNREdQ
VV9JQl9GTEFHX1BSRUVNUFQpKSB7DQo+ICsgICAgIGlmICgoYW1kZ3B1X3NyaW92X3ZmKHJpbmct
PmFkZXYpIHx8IGFtZGdwdV9tY2JwKSAmJiAoaWItPmZsYWdzICYNCj4gKyBBTURHUFVfSUJfRkxB
R19QUkVFTVBUKSkgew0KPiAgICAgICAgICAgICAgIGNvbnRyb2wgfD0gSU5ESVJFQ1RfQlVGRkVS
X1BSRV9FTkIoMSk7DQo+DQo+ICsgICAgICAgICAgICAgaWYgKGZsYWdzICYgQU1ER1BVX0lCX1BS
RUVNUFRFRCkNCj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRyb2wgfD0gSU5ESVJFQ1RfQlVG
RkVSX1BSRV9SRVNVTUUoMSk7DQo+ICsNCj4gICAgICAgICAgICAgICBpZiAoIShpYi0+ZmxhZ3Mg
JiBBTURHUFVfSUJfRkxBR19DRSkgJiYgdm1pZCkNCj4gLSAgICAgICAgICAgICAgICAgICAgIGdm
eF92OV8wX3JpbmdfZW1pdF9kZV9tZXRhKHJpbmcpOw0KPiArICAgICAgICAgICAgICAgICAgICAg
Z2Z4X3Y5XzBfcmluZ19lbWl0X2RlX21ldGEocmluZywNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICghYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYpICYmIGZsYWdzICYgQU1ER1BV
X0lCX1BSRUVNUFRFRCkgPw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRydWUgOiBmYWxzZSk7DQo+ICAgICAgIH0NCj4NCj4gICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgaGVhZGVyKTsgQEAgLTU1MDUsNiArNTUxMSw3IEBAIHN0YXRpYw0KPiB2b2lkIGdmeF92
OV8wX3JpbmdfZW1pdF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2NCBhZGRyLA0K
PiAgICAgICBib29sIHdyaXRlNjRiaXQgPSBmbGFncyAmIEFNREdQVV9GRU5DRV9GTEFHXzY0QklU
Ow0KPiAgICAgICBib29sIGludF9zZWwgPSBmbGFncyAmIEFNREdQVV9GRU5DRV9GTEFHX0lOVDsN
Cj4gICAgICAgYm9vbCB3cml0ZWJhY2sgPSBmbGFncyAmIEFNREdQVV9GRU5DRV9GTEFHX1RDX1dC
X09OTFk7DQo+ICsgICAgIGJvb2wgZXhlYyA9IGZsYWdzICYgQU1ER1BVX0ZFTkNFX0ZMQUdfRVhF
QzsNCj4NCj4gICAgICAgLyogUkVMRUFTRV9NRU0gLSBmbHVzaCBjYWNoZXMsIHNlbmQgaW50ICov
DQo+ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19SRUxFQVNF
X01FTSwgNikpOyBAQA0KPiAtNTUxNSw2ICs1NTIyLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBf
cmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdTY0IGFkZHIsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVPUF9UQ19XQl9BQ1RJ
T05fRU4gfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBF
T1BfVENfTURfQUNUSU9OX0VOKSkgfA0KPg0KPiBFVkVOVF9UWVBFKENBQ0hFX0ZMVVNIX0FORF9J
TlZfVFNfRVZFTlQpIHwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChleGVjID8g
RU9QX0VYRUMgOiAweDApIHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVWRU5U
X0lOREVYKDUpKSk7DQo+ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIERBVEFfU0VMKHdy
aXRlNjRiaXQgPyAyIDogMSkgfA0KPiBJTlRfU0VMKGludF9zZWwgPyAyIDogMCkpOw0KPg0KPiBA
QCAtNTYyMCwzMyArNTYyOCwxMzUgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5X3JpbmdfZW1pdF9zYihz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IDApOw0KPiAgIH0NCj4NCj4gLXN0YXRpYyB2b2lkIGdmeF92OV8wX3JpbmdfZW1pdF9jZV9tZXRh
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4gK3N0YXRpYyB2b2lkIGdmeF92OV8wX3Jpbmdf
ZW1pdF9jZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgYm9vbA0KPiArcmVzdW1lKQ0K
PiAgIHsNCj4gKyAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0K
PiAgICAgICBzdHJ1Y3QgdjlfY2VfaWJfc3RhdGUgY2VfcGF5bG9hZCA9IHswfTsNCj4gLSAgICAg
dWludDY0X3QgY3NhX2FkZHI7DQo+ICsgICAgIHVpbnQ2NF90IG9mZnNldCwgY2VfcGF5bG9hZF9n
cHVfYWRkcjsNCj4gKyAgICAgdm9pZCAqY2VfcGF5bG9hZF9jcHVfYWRkcjsNCj4gICAgICAgaW50
IGNudDsNCj4NCj4gICAgICAgY250ID0gKHNpemVvZihjZV9wYXlsb2FkKSA+PiAyKSArIDQgLSAy
Ow0KPiAtICAgICBjc2FfYWRkciA9IGFtZGdwdV9jc2FfdmFkZHIocmluZy0+YWRldik7DQo+ICsN
Cj4gKyAgICAgaWYgKHJpbmctPmlzX21lc19xdWV1ZSkgew0KPiArICAgICAgICAgICAgIG9mZnNl
dCA9IG9mZnNldG9mKHN0cnVjdCBhbWRncHVfbWVzX2N0eF9tZXRhX2RhdGEsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ2Z4WzBdLmdmeF9tZXRhX2RhdGEpICsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCB2OV9nZnhfbWV0YV9kYXRhLCBjZV9wYXls
b2FkKTsNCj4gKyAgICAgICAgICAgICBjZV9wYXlsb2FkX2dwdV9hZGRyID0NCj4gKyAgICAgICAg
ICAgICAgICAgICAgIGFtZGdwdV9tZXNfY3R4X2dldF9vZmZzX2dwdV9hZGRyKHJpbmcsIG9mZnNl
dCk7DQo+ICsgICAgICAgICAgICAgY2VfcGF5bG9hZF9jcHVfYWRkciA9DQo+ICsgICAgICAgICAg
ICAgICAgICAgICBhbWRncHVfbWVzX2N0eF9nZXRfb2Zmc19jcHVfYWRkcihyaW5nLCBvZmZzZXQp
Ow0KPiArICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgIG9mZnNldCA9IG9mZnNldG9mKHN0
cnVjdCB2OV9nZnhfbWV0YV9kYXRhLCBjZV9wYXlsb2FkKTsNCj4gKyAgICAgICAgICAgICBjZV9w
YXlsb2FkX2dwdV9hZGRyID0gYW1kZ3B1X2NzYV92YWRkcihyaW5nLT5hZGV2KSArIG9mZnNldDsN
Cj4gKyAgICAgICAgICAgICBjZV9wYXlsb2FkX2NwdV9hZGRyID0gYWRldi0+dmlydC5jc2FfY3B1
X2FkZHIgKyBvZmZzZXQ7DQo+ICsgICAgIH0NCj4NCj4gICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RBVEEsIGNudCkpOw0KPiAgICAgICBhbWRncHVf
cmluZ193cml0ZShyaW5nLCAoV1JJVEVfREFUQV9FTkdJTkVfU0VMKDIpIHwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFdSSVRFX0RBVEFfRFNUX1NFTCg4KSB8DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBXUl9DT05GSVJNKSB8DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBXUklURV9EQVRBX0NBQ0hFX1BPTElDWSgwKSk7DQo+IC0gICAgIGFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIGxvd2VyXzMyX2JpdHMoY3NhX2FkZHIgKyBvZmZzZXRvZihzdHJ1
Y3QgdjlfZ2Z4X21ldGFfZGF0YSwgY2VfcGF5bG9hZCkpKTsNCj4gLSAgICAgYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgdXBwZXJfMzJfYml0cyhjc2FfYWRkciArIG9mZnNldG9mKHN0cnVjdCB2OV9n
ZnhfbWV0YV9kYXRhLCBjZV9wYXlsb2FkKSkpOw0KPiAtICAgICBhbWRncHVfcmluZ193cml0ZV9t
dWx0aXBsZShyaW5nLCAodm9pZCAqKSZjZV9wYXlsb2FkLCBzaXplb2YoY2VfcGF5bG9hZCkgPj4g
Mik7DQo+ICsgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIGxvd2VyXzMyX2JpdHMoY2VfcGF5
bG9hZF9ncHVfYWRkcikpOw0KPiArICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8z
Ml9iaXRzKGNlX3BheWxvYWRfZ3B1X2FkZHIpKTsNCj4gKw0KPiArICAgICBpZiAocmVzdW1lKQ0K
PiArICAgICAgICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlX211bHRpcGxlKHJpbmcsIGNlX3BheWxv
YWRfY3B1X2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZW9mKGNlX3BheWxvYWQpID4+IDIpOw0KPiArICAgICBlbHNlDQo+ICsgICAgICAgICAgICAg
YW1kZ3B1X3Jpbmdfd3JpdGVfbXVsdGlwbGUocmluZywgKHZvaWQgKikmY2VfcGF5bG9hZCwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoY2VfcGF5bG9h
ZCkgPj4gMik7IH0NCj4gKw0KPiArc3RhdGljIGludCBnZnhfdjlfMF9yaW5nX3ByZWVtcHRfaWIo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKSB7DQo+ICsgICAgIGludCBpLCByID0gMDsNCj4gKyAg
ICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KPiArICAgICBzdHJ1
Y3QgYW1kZ3B1X2tpcSAqa2lxID0gJmFkZXYtPmdmeC5raXE7DQo+ICsgICAgIHN0cnVjdCBhbWRn
cHVfcmluZyAqa2lxX3JpbmcgPSAma2lxLT5yaW5nOw0KPiArICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPiArDQo+ICsgICAgIGlmICgha2lxLT5wbWYgfHwgIWtpcS0+cG1mLT5raXFfdW5tYXBf
cXVldWVzKQ0KPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZraXEtPnJpbmdfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICsgICAgIGlm
IChhbWRncHVfcmluZ19hbGxvYyhraXFfcmluZywga2lxLT5wbWYtPnVubWFwX3F1ZXVlc19zaXpl
KSkgew0KPiArICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmtpcS0+cmluZ19s
b2NrLCBmbGFncyk7DQo+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsgICAgIH0N
Cj4gKw0KPiArICAgICAvKiBhc3NlcnQgcHJlZW1wdGlvbiBjb25kaXRpb24gKi8NCj4gKyAgICAg
YW1kZ3B1X3Jpbmdfc2V0X3ByZWVtcHRfY29uZF9leGVjKHJpbmcsIGZhbHNlKTsNCj4gKw0KPiAr
ICAgICByaW5nLT50cmFpbF9zZXEgKz0gMTsNCj4gKyAgICAgYW1kZ3B1X3JpbmdfYWxsb2Mocmlu
ZywgMTMpOw0KPiArICAgICBnZnhfdjlfMF9yaW5nX2VtaXRfZmVuY2UocmluZywgcmluZy0+dHJh
aWxfZmVuY2VfZ3B1X2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlu
Zy0+dHJhaWxfc2VxLCBBTURHUFVfRkVOQ0VfRkxBR19FWEVDKTsNCj4gKyAgICAgLypyZXNldCB0
aGUgQ1BfVk1JRF9QUkVFTVBUIGFmdGVyIHRyYWlsaW5nIGZlbmNlKi8NCj4gKyAgICAgYW1kZ3B1
X3JpbmdfZW1pdF93cmVnKHJpbmcsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
U09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1DUF9WTUlEX1BSRUVNUFQpLA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MCk7DQo+ICsNCj4gKyAgICAgLyogYXNzZXJ0IElCIHBy
ZWVtcHRpb24sIGVtaXQgdGhlIHRyYWlsaW5nIGZlbmNlICovDQo+ICsgICAgIGtpcS0+cG1mLT5r
aXFfdW5tYXBfcXVldWVzKGtpcV9yaW5nLCByaW5nLCBQUkVFTVBUX1FVRVVFU19OT19VTk1BUCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmluZy0+dHJhaWxfZmVuY2VfZ3B1
X2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpbmctPnRyYWlsX3Nl
cSk7DQo+ICsNCj4gKyAgICAgYW1kZ3B1X3JpbmdfY29tbWl0KGtpcV9yaW5nKTsNCj4gKyAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgma2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsNCj4gKw0KPiAr
ICAgICAvKiBwb2xsIHRoZSB0cmFpbGluZyBmZW5jZSAqLw0KPiArICAgICBmb3IgKGkgPSAwOyBp
IDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsNCj4gKyAgICAgICAgICAgICBpZiAocmluZy0+
dHJhaWxfc2VxID09DQo+ICsgICAgICAgICAgICAgICAgIGxlMzJfdG9fY3B1KCoocmluZy0+dHJh
aWxfZmVuY2VfY3B1X2FkZHIpKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAr
ICAgICAgICAgICAgIHVkZWxheSgxKTsNCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIGlmIChpID49
IGFkZXYtPnVzZWNfdGltZW91dCkgew0KPiArICAgICAgICAgICAgIHIgPSAtRUlOVkFMOw0KPiAr
ICAgICAgICAgICAgIERSTV9FUlJPUigicmluZyAlZCBmYWlsZWQgdG8gcHJlZW1wdCBpYlxuIiwg
cmluZy0+aWR4KTsNCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIGFtZGdwdV9yaW5nX2NvbW1pdChy
aW5nKTsNCj4gKw0KPiArICAgICAvKiBkZWFzc2VydCBwcmVlbXB0aW9uIGNvbmRpdGlvbiAqLw0K
PiArICAgICBhbWRncHVfcmluZ19zZXRfcHJlZW1wdF9jb25kX2V4ZWMocmluZywgdHJ1ZSk7DQo+
ICsgICAgIHJldHVybiByOw0KPiAgIH0NCj4NCj4gLXN0YXRpYyB2b2lkIGdmeF92OV8wX3Jpbmdf
ZW1pdF9kZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4gK3N0YXRpYyB2b2lkIGdm
eF92OV8wX3JpbmdfZW1pdF9kZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgYm9vbA0K
PiArcmVzdW1lKQ0KPiAgIHsNCj4gKyAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBy
aW5nLT5hZGV2Ow0KPiAgICAgICBzdHJ1Y3QgdjlfZGVfaWJfc3RhdGUgZGVfcGF5bG9hZCA9IHsw
fTsNCj4gLSAgICAgdWludDY0X3QgY3NhX2FkZHIsIGdkc19hZGRyOw0KPiArICAgICB1aW50NjRf
dCBvZmZzZXQsIGdkc19hZGRyLCBkZV9wYXlsb2FkX2dwdV9hZGRyOw0KPiArICAgICB2b2lkICpk
ZV9wYXlsb2FkX2NwdV9hZGRyOw0KPiAgICAgICBpbnQgY250Ow0KPg0KPiAtICAgICBjc2FfYWRk
ciA9IGFtZGdwdV9jc2FfdmFkZHIocmluZy0+YWRldik7DQo+IC0gICAgIGdkc19hZGRyID0gY3Nh
X2FkZHIgKyA0MDk2Ow0KPiArICAgICBpZiAocmluZy0+aXNfbWVzX3F1ZXVlKSB7DQo+ICsgICAg
ICAgICAgICAgb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IGFtZGdwdV9tZXNfY3R4X21ldGFfZGF0
YSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZnhbMF0uZ2Z4X21ldGFfZGF0
YSkgKw0KPiArICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IHY5X2dmeF9tZXRh
X2RhdGEsIGRlX3BheWxvYWQpOw0KPiArICAgICAgICAgICAgIGRlX3BheWxvYWRfZ3B1X2FkZHIg
PQ0KPiArICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X21lc19jdHhfZ2V0X29mZnNfZ3B1X2Fk
ZHIocmluZywgb2Zmc2V0KTsNCj4gKyAgICAgICAgICAgICBkZV9wYXlsb2FkX2NwdV9hZGRyID0N
Cj4gKyAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9tZXNfY3R4X2dldF9vZmZzX2NwdV9hZGRy
KHJpbmcsIG9mZnNldCk7DQo+ICsNCj4gKyAgICAgICAgICAgICBvZmZzZXQgPSBvZmZzZXRvZihz
dHJ1Y3QgYW1kZ3B1X21lc19jdHhfbWV0YV9kYXRhLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdmeFswXS5nZHNfYmFja3VwKSArDQo+ICsgICAgICAgICAgICAgICAgICAgICBv
ZmZzZXRvZihzdHJ1Y3QgdjlfZ2Z4X21ldGFfZGF0YSwgZGVfcGF5bG9hZCk7DQo+ICsgICAgICAg
ICAgICAgZ2RzX2FkZHIgPSBhbWRncHVfbWVzX2N0eF9nZXRfb2Zmc19ncHVfYWRkcihyaW5nLCBv
ZmZzZXQpOw0KPiArICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgIG9mZnNldCA9IG9mZnNl
dG9mKHN0cnVjdCB2OV9nZnhfbWV0YV9kYXRhLCBkZV9wYXlsb2FkKTsNCj4gKyAgICAgICAgICAg
ICBkZV9wYXlsb2FkX2dwdV9hZGRyID0gYW1kZ3B1X2NzYV92YWRkcihyaW5nLT5hZGV2KSArIG9m
ZnNldDsNCj4gKyAgICAgICAgICAgICBkZV9wYXlsb2FkX2NwdV9hZGRyID0gYWRldi0+dmlydC5j
c2FfY3B1X2FkZHIgKyBvZmZzZXQ7DQo+ICsNCj4gKyAgICAgICAgICAgICBnZHNfYWRkciA9IEFM
SUdOKGFtZGdwdV9jc2FfdmFkZHIocmluZy0+YWRldikgKw0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQU1ER1BVX0NTQV9TSVpFIC0gYWRldi0+Z2RzLmdkc19zaXplLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFKTsNCj4gKyAgICAgfQ0KPiArDQo+
ICAgICAgIGRlX3BheWxvYWQuZ2RzX2JhY2t1cF9hZGRybG8gPSBsb3dlcl8zMl9iaXRzKGdkc19h
ZGRyKTsNCj4gICAgICAgZGVfcGF5bG9hZC5nZHNfYmFja3VwX2FkZHJoaSA9IHVwcGVyXzMyX2Jp
dHMoZ2RzX2FkZHIpOw0KPg0KPiBAQCAtNTY1Niw5ICs1NzY2LDE1IEBAIHN0YXRpYyB2b2lkIGdm
eF92OV8wX3JpbmdfZW1pdF9kZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdSSVRFX0RBVEFfRFNUX1NFTCg4KSB8DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXUl9DT05GSVJNKSB8DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBXUklURV9EQVRBX0NBQ0hFX1BPTElDWSgwKSk7DQo+IC0gICAg
IGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIGxvd2VyXzMyX2JpdHMoY3NhX2FkZHIgKyBvZmZzZXRv
ZihzdHJ1Y3QgdjlfZ2Z4X21ldGFfZGF0YSwgZGVfcGF5bG9hZCkpKTsNCj4gLSAgICAgYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgdXBwZXJfMzJfYml0cyhjc2FfYWRkciArIG9mZnNldG9mKHN0cnVj
dCB2OV9nZnhfbWV0YV9kYXRhLCBkZV9wYXlsb2FkKSkpOw0KPiAtICAgICBhbWRncHVfcmluZ193
cml0ZV9tdWx0aXBsZShyaW5nLCAodm9pZCAqKSZkZV9wYXlsb2FkLCBzaXplb2YoZGVfcGF5bG9h
ZCkgPj4gMik7DQo+ICsgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIGxvd2VyXzMyX2JpdHMo
ZGVfcGF5bG9hZF9ncHVfYWRkcikpOw0KPiArICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCB1
cHBlcl8zMl9iaXRzKGRlX3BheWxvYWRfZ3B1X2FkZHIpKTsNCj4gKw0KPiArICAgICBpZiAocmVz
dW1lKQ0KPiArICAgICAgICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlX211bHRpcGxlKHJpbmcsIGRl
X3BheWxvYWRfY3B1X2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKGRlX3BheWxvYWQpID4+IDIpOw0KPiArICAgICBlbHNlDQo+ICsgICAgICAg
ICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGVfbXVsdGlwbGUocmluZywgKHZvaWQgKikmZGVfcGF5bG9h
ZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoZGVf
cGF5bG9hZCkgPj4gMik7DQo+ICAgfQ0KPg0KPiAgIHN0YXRpYyB2b2lkIGdmeF92OV8wX3Jpbmdf
ZW1pdF9mcmFtZV9jbnRsKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywNCj4gYm9vbCBzdGFydCwg
QEAgLTU2NzQsOCArNTc5MCwxMCBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfcmluZ19lbWl0X2NudHhj
bnRsKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgZmxhZ3MpDQo+ICAgew0KPiAg
ICAgICB1aW50MzJfdCBkdzIgPSAwOw0KPg0KPiAtICAgICBpZiAoYW1kZ3B1X3NyaW92X3ZmKHJp
bmctPmFkZXYpKQ0KPiAtICAgICAgICAgICAgIGdmeF92OV8wX3JpbmdfZW1pdF9jZV9tZXRhKHJp
bmcpOw0KPiArICAgICBpZiAoYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYpIHx8IGFtZGdwdV9t
Y2JwKQ0KPiArICAgICAgICAgICAgIGdmeF92OV8wX3JpbmdfZW1pdF9jZV9tZXRhKHJpbmcsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCFhbWRncHVfc3Jpb3ZfdmYo
cmluZy0+YWRldikgJiYNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsYWdzICYNCj4gKyBBTURHUFVfSUJfUFJFRU1QVEVEKSA/IHRydWUgOiBmYWxzZSk7
DQo+DQo+ICAgICAgIGR3MiB8PSAweDgwMDAwMDAwOyAvKiBzZXQgbG9hZF9lbmFibGUgb3RoZXJ3
aXNlIHRoaXMgcGFja2FnZSBpcyBqdXN0IE5PUHMgKi8NCj4gICAgICAgaWYgKGZsYWdzICYgQU1E
R1BVX0hBVkVfQ1RYX1NXSVRDSCkgeyBAQCAtNzAyNCw2ICs3MTQyLDcgQEANCj4gc3RhdGljIGNv
bnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyBnZnhfdjlfMF9yaW5nX2Z1bmNzX2dmeCA9IHsN
Cj4gICAgICAgLmVtaXRfY250eGNudGwgPSBnZnhfdjlfcmluZ19lbWl0X2NudHhjbnRsLA0KPiAg
ICAgICAuaW5pdF9jb25kX2V4ZWMgPSBnZnhfdjlfMF9yaW5nX2VtaXRfaW5pdF9jb25kX2V4ZWMs
DQo+ICAgICAgIC5wYXRjaF9jb25kX2V4ZWMgPSBnZnhfdjlfMF9yaW5nX2VtaXRfcGF0Y2hfY29u
ZF9leGVjLA0KPiArICAgICAucHJlZW1wdF9pYiA9IGdmeF92OV8wX3JpbmdfcHJlZW1wdF9pYiwN
Cj4gICAgICAgLmVtaXRfZnJhbWVfY250bCA9IGdmeF92OV8wX3JpbmdfZW1pdF9mcmFtZV9jbnRs
LA0KPiAgICAgICAuZW1pdF93cmVnID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3dyZWcsDQo+ICAgICAg
IC5lbWl0X3JlZ193YWl0ID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3JlZ193YWl0LCBkaWZmIC0tZ2l0
DQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNWQuaA0KPiBpbmRleCA3OTk5MjVkMjJmYzguLjYxNGU5Zjg0
NjdmYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmgNCj4gQEAgLTE2Miw2
ICsxNjIsNyBAQA0KPiAgICAgICAgICAgICAgICAqIDIgLSBCeXBhc3MNCj4gICAgICAgICAgICAg
ICAgKi8NCj4gICAjZGVmaW5lICAgICBJTkRJUkVDVF9CVUZGRVJfUFJFX0VOQih4KSAgICAgICAg
ICAgICAgICgoeCkgPDwgMjEpDQo+ICsjZGVmaW5lICAgICBJTkRJUkVDVF9CVUZGRVJfUFJFX1JF
U1VNRSh4KSAgICAgICAgICAgKCh4KSA8PCAzMCkNCj4gICAjZGVmaW5lICAgICBQQUNLRVQzX0NP
UFlfREFUQSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDQwDQo+ICAgI2RlZmluZSAg
ICAgUEFDS0VUM19QRlBfU1lOQ19NRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg0Mg0K
PiAgICNkZWZpbmUgICAgIFBBQ0tFVDNfQ09ORF9XUklURSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NDUNCj4gQEAgLTE4NCw2ICsxODUsNyBAQA0KPiAgICNkZWZpbmUgICAgICAgICAg
ICAgRU9QX1RDX0FDVElPTl9FTiAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8IDE3KSAvKiBM
MiAqLw0KPiAgICNkZWZpbmUgICAgICAgICAgICAgRU9QX1RDX05DX0FDVElPTl9FTiAgICAgICAg
ICAgICAgICAgICAgICgxIDw8IDE5KQ0KPiAgICNkZWZpbmUgICAgICAgICAgICAgRU9QX1RDX01E
X0FDVElPTl9FTiAgICAgICAgICAgICAgICAgICAgICgxIDw8IDIxKSAvKiBMMiBtZXRhZGF0YSAq
Lw0KPiArI2RlZmluZSAgICAgICAgICAgICAgRU9QX0VYRUMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKDEgPDwgMjgpIC8qIEZvciBUcmFpbGluZyBGZW5jZSAqLw0KPg0K
PiAgICNkZWZpbmUgICAgICAgICAgICAgREFUQV9TRUwoeCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICgoeCkgPDwgMjkpDQo+ICAgICAgICAgICAgICAgLyogMCAtIGRpc2NhcmQNCg0K
