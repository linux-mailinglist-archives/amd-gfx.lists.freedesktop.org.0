Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861950B2DC
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Apr 2022 10:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74FB112036;
	Fri, 22 Apr 2022 08:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47A9112036
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Apr 2022 08:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlfFknk5KmhmyWKjNwmU6pxZNcdH9iWmYvBU0lwQbIiYBPUdpset0KD/T9Rnv/96qjAUszmm+MVx5I31EyRjq4nCx4zJMvXuriHOmhlFt8AHUlUR8ztpVdmRZ+AAjlf5JJWvcrvER2L/6GQbi+qnx+BtkFgf6oIPzhefFhWBo9D37ZB7VPzwX4rCBKUVVhxy9aP7ni+H9toBj0g6UW6UklTg081C6T8nSJgE0eU+/UPTTqQF0VqOVmeZtCNsPthkDWhMoBQDZNrfmfZ/wFdyRGZHhQxxXmZf8yW7iswuySage59+OXJx3s4OwkcqJ/W/uSJfcPuEt0pwZeZ1xSq3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTQkWIcQ1gXaFHLMJsdxVqmZzx6DzElPawj8UAps2cA=;
 b=Y6SOrKBgAEpkyld05dzRSpU31aj441wGyzhKDfUu2zd/4uaIAqkUt8Iqa2Z4vgJQ4U9zgx9ODAnxa2AKJMJyilYWKCemn/JQgC+BxSvcfYaQp6ohmdB1uhxoRjxKEXhxQ9FVS0njP+vv0Hu+jHn8T4orNpZODJ6xHqModH8ixNcqFFsB1XkgZQNeOXj2CeAcPdNBQ992865otTuE0pijOUyJ85bguazURzUjwdTgJtwF4b+CWROIK3DdEitQPd1u9w11QfJiGNMavCrSs3l+6qfVoQsWpwFUrdNvyg5uAJjHmRuCrgWgf1hoLqAG4NTnwWQYKn3o2MZtG/NLje6NgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTQkWIcQ1gXaFHLMJsdxVqmZzx6DzElPawj8UAps2cA=;
 b=QNnKJ1oAKhcZ0Epy0+ZB/73n4DHQne9lQeocUKNwT+upyoBso1X7zThHd2CjuNKpRBBa5KANvzK/rmKADpiZYO3ajJH4cP0Fjb7QZaOU9muwbvgXx5Thhyu18NpN71cio0tkECXtmAeZ4K0Dy1Op9r8K1D6PbmJ9BeyFjwl2lIc=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BYAPR12MB2872.namprd12.prod.outlook.com (2603:10b6:a03:12e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Fri, 22 Apr
 2022 08:27:59 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::8558:f9a2:7eec:cfa3]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::8558:f9a2:7eec:cfa3%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 08:27:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/amd/pm: fix the deadlock issue observed on SI
Thread-Topic: [PATCH V2] drm/amd/pm: fix the deadlock issue observed on SI
Thread-Index: AQHYTYHgfs1EKjpJg0KMdZLy10ULmazqfJmAgBErNoA=
Date: Fri, 22 Apr 2022 08:27:59 +0000
Message-ID: <DM6PR12MB26195A5106718D1661686DC6E4F79@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220411085453.38063-1-evan.quan@amd.com>
 <371afc58-5ee7-8171-90c2-05bb163e40ea@amd.com>
In-Reply-To: <371afc58-5ee7-8171-90c2-05bb163e40ea@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-22T08:27:56Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=b2e618a2-4914-4675-a8e4-7aceb374b1e8;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5062d7d-8e06-4b3e-9035-08da243a023c
x-ms-traffictypediagnostic: BYAPR12MB2872:EE_
x-microsoft-antispam-prvs: <BYAPR12MB28729A7CB6B848417B59D3BEE4F79@BYAPR12MB2872.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aACPAbdm5/wtEc6IfkDx3Th5JRLc/LdRF380DIRKmht6/2iGiRp9E41D1Wy/nc/zQE3Ix2sk+1tdNlPvz1vw6Z20pD68xqZuJm4tneAXTTsZ+WcYKZsqIX5kkJbPFAy+SYWKBKEUxwLr798XgxH3MeQ4Ci6fxTjrBvHvudSIXrFwUho2m3JNz0pD0JYSTUhJhrhidJ36MLEuc5kFRueJmzEvxvJ7vRRQysryS1kY21GItqitzVShy06uD7tPewcD0jpWXgHS9MAMrcclBThLt5HNGlahT90MS0uFTTE4t5UCrNqrzqVO5JV7sc7O5E4806UXJrT2DmfvZOr8dAbGm1+Bz6CmZcieo02rg3WBMyxRpbzyiH1d4/cKqmEN5Bh0uYkVlm15vnBh9wFMMCDHY7JQHLpcA69WubpJPm08LOAbyY3PLQGPH9E7eHyN8d2rQDi1PAjpaUfRlJc1QKDD1QmwNcSzRtLb8XDYwyRwXwQd0Z3dddN56pAQOA8Dbnd88gzChmuYa4w4OReEGghDmOwpstDeakHSRim760XcJCDs3/in7w2V73Z5z3f6Iv2xaGzOHi6RWjdNm/jqqnc+f787PM00wUHvECH8g6FcSvc/51rWXT4onXONVpHoqVv336cczugucImYdxk5fdITA0rW9TQ+JO8dy1erZJFXGBYGX7otMf0VCvTOAy0VQnlcgiyLTQF9xmX8/zuCjL+IPBnMx8fpqgxNv9wUge6raKw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(53546011)(4326008)(8676002)(38100700002)(38070700005)(5660300002)(33656002)(71200400001)(508600001)(55016003)(122000001)(26005)(9686003)(8936002)(2906002)(7696005)(52536014)(186003)(6506007)(316002)(64756008)(86362001)(66476007)(66556008)(66446008)(66946007)(110136005)(54906003)(76116006)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWlhUjVYSk9rQnhqbUEzVElueG1QdWpQUUZaUmNjMmlpTFJWZ0lhSTg0QmNn?=
 =?utf-8?B?VGltcWdtOFFlMElUSWJVME5RSktjZHh6djVwVkhqVEZzMWgrNjlENm9mTjdD?=
 =?utf-8?B?TXBKVmkxNmdBeVpCWTBTcHZBOENJbzJMVit2bklRbXdBenRHKzBrSUNYbU94?=
 =?utf-8?B?Vjg3Vkhnbi95bkh1UEduQVZEMzJVZ0gzZzdqNUJlNVlQWlZ6K0x3a1ZXdmJK?=
 =?utf-8?B?Q3g3K2VWK2hKdFVyYXdEQkZrNDY4SWppL3UxMW00T0tlaVg0cFRwL1RKTmU1?=
 =?utf-8?B?Z3RIcm0weWVwdW9pcS9WY0ZHSTQ2akNYOHFXclY1dnUrNXp3NWlnNXVsczJ3?=
 =?utf-8?B?SDd0Z09BdVdMRFZZQ0wvekRJMndsMlhLUUh1UWNVdGRad2swNzFCU3pKZVVF?=
 =?utf-8?B?MXhiaGdac2VvOFJGRnpIc3c0R1BYZ3VDa1pzTVNWZ3dFdm9yOWlTV0w3akpT?=
 =?utf-8?B?dEhWZW9NR01SRUk4TDVlL2xlOWVTZ002RmFZSjY3eFVnNXZ3Z25uamc4VGpz?=
 =?utf-8?B?WW16TWdrRHRDYmptSWROc0JTUXM5cHpEL0FqbHBVWmF1eEVaMllhMDl5bWR5?=
 =?utf-8?B?T0RHOS9uK21veHVKWVNQbm0xV0oyU2t2eWkvY1Fub1E1QlYyOGhxS0c2N2lJ?=
 =?utf-8?B?ZkltVUszQnlySzdrZXloemN2ajRLdi9EM1M0NEtHV0tmVGhmeW9hYTJCVHZS?=
 =?utf-8?B?SFk3Z3lrMUV2K0NOY1RoK1Qwbm9mYzNpSllmQ1FKV2hubWptRGRrbzAreElQ?=
 =?utf-8?B?NVRESmZDbDZVTHJrRmFHMVMwWDF0MXhRZW9xQnliUWRoSElYL3IyUEVyUmln?=
 =?utf-8?B?dWV1ZmN3OGFPSE1xVlNvbmlFcUNwNjlEVmVPSEg1cEZsMm9qOUVOZERwcVJl?=
 =?utf-8?B?S0VEMlJqRmJ0S1lwbHlsY0Q4QWkyVVVpM1paL0o0SHV1aDZJREIyOW1hUDZl?=
 =?utf-8?B?Z2ZvTVB1ZkxBSnYybVVST1NPRTVsOVNTZUV6RW1HendtTFdiZmVHM2dqYlpB?=
 =?utf-8?B?TGxsRW5wdGE0clMyUUZSM053Q2VUUzQ4N2wxU1JyRGVWUW13Ti9vZXo1anZW?=
 =?utf-8?B?WVpkQzY2MnF4YlkvZDBvd0N2MVFUanV0clZKT3hUWTExRnRoNjN6QUtpc2hJ?=
 =?utf-8?B?VGFkY2lPNUZvTjJnOWFwNHBvYUJVSm5IMUtjcmY0QmJldnB5VHR6VnF2cytr?=
 =?utf-8?B?dzhFZ0k2cWxXdTllbGR5Rys4aElRUEVLNldKcFUrV0grNXlPQU14SGpsT3p0?=
 =?utf-8?B?NlNPSmpoNHQvTEs2dVV2cFllUHBxY05iRUltRXp1WEs2UzFobzBTdVY1emZW?=
 =?utf-8?B?S1UrSnlUQmZSZ2lDcmtaeFpVekFzeC9iQ2FwektqR1JCN3hSdjNaRHhWTlpP?=
 =?utf-8?B?SWhjdGU0U3dFZnlaM1NnYjRFK2IxWGYrOVB3TXgwWGlNK3VOQkxnSVorNStD?=
 =?utf-8?B?MCt3V0RXVzgxQ3NtVG5jQk9UQ3pZT2FEVFZucUMrS09HY3ZjcGFsaElOb1Rl?=
 =?utf-8?B?ZnZnL2FGVUp1eVVlY3NNaXlQNE9DRmd0ODJOWXlhR2RTU3JpWWtZREl2dldE?=
 =?utf-8?B?RUVIaVowekI3c0ZsWS9pNk9lR3h1a0hKYmNzYmlIRm1pd1ZKazBscEF3c0hn?=
 =?utf-8?B?bmhsWTF4UTVvNkxBVUxINFJmbWlZTi9LcGRDSC9YOEZYMjlJMW9XeVNUbDlD?=
 =?utf-8?B?aXlJWE9pRDZjQ1ZWb0MzNWVwQjRvNEYvUkxxSytOU2Q5RExDa3VqaFVQUVF5?=
 =?utf-8?B?Y3JMaTlzVFVLUFdZbUFPODFPeExENkVZZTd4clczOG9abjJMSTd5cGNaSFFw?=
 =?utf-8?B?SUVSamk5L3prRzEvdDQwQWxhYWQvSUU1Wi9MVktIYXJ2SFMwakRVbkpuZnFS?=
 =?utf-8?B?V1NDV1dPUkFLb1VBSnBlLzhlODBibGlrM05iZGpkVE01azM1aFk2OGxYWkpK?=
 =?utf-8?B?eC90MFc0VnB2ZWlVUmFZTFR2T1NKK0UralBLcW9rekRlL2tIQVp2YzI5Wnox?=
 =?utf-8?B?OVJOY3pkQ21ndUNNM3FHb0M2U0U5U0JxY3puVGVvOVk3ZlBxTno2SllrS3RZ?=
 =?utf-8?B?SWEyc2xtR3hGL21KdXY3WTVtSUNOWDFWc0NhaHhIakVzMmgvUnp3ZitmU3VK?=
 =?utf-8?B?WWtsMkx4RytyUXh3VlpPUWJsZFNLQld5RU1WcEFtUDBkVVFlV2pkazNVK0J1?=
 =?utf-8?B?cFVtcEZFTk9rdXovb09uL1gxN0NXUld5ei9QYncyOGRJTjk2bzh2RjQzcUQv?=
 =?utf-8?B?ZmZYeDQwR1ZtTkNhMVBpMGhNVW54SmU1QWhZTmxsT0R2cmduQzh1N3F1anFH?=
 =?utf-8?Q?yjGGI+opsfEeb2YOdj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5062d7d-8e06-4b3e-9035-08da243a023c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 08:27:59.0416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IrpvA7uXSsqZ3pi2prnyXS9BVehJNPNA40DZxlAHXidjtk11otqZV/NleYRGMua
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "arthur.marsh@internode.on.net" <arthur.marsh@internode.on.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBBcHJpbCAxMSwgMjAyMiA2OjA2IFBNDQo+IFRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5A
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+Ow0KPiBwbWVuemVsQG1vbGdlbi5t
cGcuZGU7IGFydGh1ci5tYXJzaEBpbnRlcm5vZGUub24ubmV0DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjJdIGRybS9hbWQvcG06IGZpeCB0aGUgZGVhZGxvY2sgaXNzdWUgb2JzZXJ2ZWQgb24gU0kN
Cj4gDQo+IA0KPiANCj4gT24gNC8xMS8yMDIyIDI6MjQgUE0sIEV2YW4gUXVhbiB3cm90ZToNCj4g
PiBUaGUgYWRldi0+cG0ubXV0eCBpcyBhbHJlYWR5IGhlbGQgYXQgdGhlIGJlZ2lubmluZyBvZg0K
PiA+DQo+IGFtZGdwdV9kcG1fY29tcHV0ZV9jbG9ja3MvYW1kZ3B1X2RwbV9lbmFibGVfdXZkL2Ft
ZGdwdV9kcG1fDQo+IGVuYWJsZV92Y2UuDQo+ID4gQnV0IG9uIHRoZWlyIGNhbGxpbmcgcGF0aCwg
YW1kZ3B1X2Rpc3BsYXlfYmFuZHdpZHRoX3VwZGF0ZSB3aWxsIGJlDQo+ID4gY2FsbGVkIGFuZCB0
aHVzIGl0cyBzdWIgZnVuY3Rpb25zIGFtZGdwdV9kcG1fZ2V0X3NjbGsvbWNsay4gVGhleSB3aWxs
DQo+ID4gdGhlbiB0cnkgdG8gYWNxdWlyZSB0aGUgc2FtZSBhZGV2LT5wbS5tdXRleCBhbmQgZGVh
ZGxvY2sgd2lsbCBvY2N1ci4NCj4gPg0KPiANCj4gV2hhdCBhYm91dCB1c2luZyBsb2NrZWQgdmVy
c2lvbnMgb2YgZ2V0X3NjbGsvbWNsayBhbmQgbGVhdmUgdGhlIHJlc3QgYXMgdGhleQ0KPiBhcmU/
DQpbUXVhbiwgRXZhbl0gWWVhaCwgdGhhdChhZGRpbmcgdHdvIG5ldyBBUElzIGZvciBsb2NrZWQg
dmVyc2lvbnMgb2YgZ2V0X3NjbGsvbWNsaykgc2hvdWxkIGFsc28gd29yay4gQnV0IGNvbnNpZGVy
aW5nIHRoZXJlIGNhbm5vdCBiZSBvdGhlciBBU0lDcyB3aG8gbmVlZCB0aGVtLCB0aGV5IGFyZSBr
aW5kIG9mIHJlZHVuZGFudC4NCk1lYW53aGlsZSBteSB2ZXJzaW9uIGlzIGp1c3QgdG8gZ2V0IGV2
ZXJ5dGhpbmcgcmV2ZXJ0ZWQgYmFjayB0byBpdHMgb3JpZ2luYWwuIFNvLCBpdCBzaG91bGQgYmUg
cXVpdGUgc2FmZS4gSG93IGRvIHlvdSB0aGluaz8NCg0KQlINCkV2YW4NCj4gDQo+IFRoYW5rcywN
Cj4gTGlqbw0KPiANCj4gPiBCeSBwbGFjaW5nIGFtZGdwdV9kaXNwbGF5X2JhbmR3aWR0aF91cGRh
dGUgb3V0c2lkZSBvZiBhZGV2LQ0KPiA+cG0ubXV0ZXgNCj4gPiBwcm90ZWN0aW9uKGNvbnNpZGVy
aW5nIGxvZ2ljYWxseSB0aGV5IGRvIG5vdCBuZWVkIHN1Y2ggcHJvdGVjdGlvbikgYW5kDQo+ID4g
cmVzdHJ1Y3R1cmluZyB0aGUgY2FsbCBmbG93IGFjY29yZGluZ2x5LCB3ZSBjYW4gZWxpbWluYXRl
IHRoZSBkZWFkbG9jaw0KPiA+IGlzc3VlLiBUaGlzIGNvbWVzIHdpdGggbm8gcmVhbCBsb2dpY3Mg
Y2hhbmdlLg0KPiA+DQo+ID4gRml4ZXM6IDM3MTJlN2E0OTQ1OSAoImRybS9hbWQvcG06IHVuaWZp
ZWQgbG9jayBwcm90ZWN0aW9ucyBpbg0KPiA+IGFtZGdwdV9kcG0uYyIpDQo+ID4gUmVwb3J0ZWQt
Ynk6IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+DQo+ID4gUmVwb3J0ZWQtYnk6
IEFydGh1ciBNYXJzaCA8YXJ0aHVyLm1hcnNoQGludGVybm9kZS5vbi5uZXQ+DQo+ID4gTGluazog
aHR0cHM6DQo+ID4gLy9sb3JlLmtlcm5lbC5vcmcvYWxsLzllNjg5ZmVhLTZjNjktZjRiMC04ZGVl
LTMyYzRjZjdkOGY5Y0Btb2xnZW4ubXBnLg0KPiA+IGRlLw0KPiA+IEJ1Z0xpbms6IGh0dHBzOiAv
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8xOTU3DQo+ID4gU2lnbmVk
LW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiAtLQ0KPiA+IHYxLT52
MjoNCj4gPiAgICAtIHJpY2ggdGhlIGNvbW1pdCBtZXNzYWdlcyhQYXVsKQ0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMgICAgICAgICAgIHwgMzkNCj4g
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAgLi4uL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0v
bGVnYWN5X2RwbS5jICAgIHwgMTAgLS0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
bGVnYWN5LWRwbS9zaV9kcG0uYyAgICB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAuLi4v
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyAgfCAxMCAtLS0tLQ0KPiA+
ICAgNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4gPiBpbmRleCA1NTA0
ZDgxYzc3YjcuLjcyZTdiNWQ0MGFmNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1k
Z3B1X2RwbS5jDQo+ID4gQEAgLTQyNyw2ICs0MjcsNyBAQCBpbnQgYW1kZ3B1X2RwbV9yZWFkX3Nl
bnNvcihzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgZW51bSBhbWRfcHBfc2Vuc29ycyBz
ZW5zbw0KPiA+ICAgdm9pZCBhbWRncHVfZHBtX2NvbXB1dGVfY2xvY2tzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KPiA+ICAgew0KPiA+ICAgCWNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3Mg
KnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzOw0KPiA+ICsJaW50IGk7DQo+ID4N
Cj4gPiAgIAlpZiAoIWFkZXYtPnBtLmRwbV9lbmFibGVkKQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4g
QEAgLTQzNCw2ICs0MzUsMTUgQEAgdm9pZCBhbWRncHVfZHBtX2NvbXB1dGVfY2xvY2tzKHN0cnVj
dA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiA+ICAgCWlmICghcHBfZnVuY3MtPnBtX2NvbXB1
dGVfY2xvY2tzKQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4NCj4gPiArCWlmIChhZGV2LT5tb2RlX2lu
Zm8ubnVtX2NydGMpDQo+ID4gKwkJYW1kZ3B1X2Rpc3BsYXlfYmFuZHdpZHRoX3VwZGF0ZShhZGV2
KTsNCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgaSsrKSB7
DQo+ID4gKwkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gYWRldi0+cmluZ3NbaV07DQo+ID4g
KwkJaWYgKHJpbmcgJiYgcmluZy0+c2NoZWQucmVhZHkpDQo+ID4gKwkJCWFtZGdwdV9mZW5jZV93
YWl0X2VtcHR5KHJpbmcpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgIAltdXRleF9sb2NrKCZhZGV2
LT5wbS5tdXRleCk7DQo+ID4gICAJcHBfZnVuY3MtPnBtX2NvbXB1dGVfY2xvY2tzKGFkZXYtPnBv
d2VycGxheS5wcF9oYW5kbGUpOw0KPiA+ICAgCW11dGV4X3VubG9jaygmYWRldi0+cG0ubXV0ZXgp
Ow0KPiA+IEBAIC00NDMsNiArNDUzLDIwIEBAIHZvaWQgYW1kZ3B1X2RwbV9lbmFibGVfdXZkKHN0
cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGVuYWJsZSkNCj4gPiAgIHsNCj4gPiAg
IAlpbnQgcmV0ID0gMDsNCj4gPg0KPiA+ICsJaWYgKGFkZXYtPmZhbWlseSA9PSBBTURHUFVfRkFN
SUxZX1NJKSB7DQo+ID4gKwkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOw0KPiA+ICsJCWlm
IChlbmFibGUpIHsNCj4gPiArCQkJYWRldi0+cG0uZHBtLnV2ZF9hY3RpdmUgPSB0cnVlOw0KPiA+
ICsJCQlhZGV2LT5wbS5kcG0uc3RhdGUgPQ0KPiBQT1dFUl9TVEFURV9UWVBFX0lOVEVSTkFMX1VW
RDsNCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQlhZGV2LT5wbS5kcG0udXZkX2FjdGl2ZSA9IGZh
bHNlOw0KPiA+ICsJCX0NCj4gPiArCQltdXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsNCj4g
PiArDQo+ID4gKwkJYW1kZ3B1X2RwbV9jb21wdXRlX2Nsb2NrcyhhZGV2KTsNCj4gPiArCQlyZXR1
cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAgCXJldCA9IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0
aW5nX2J5X3NtdShhZGV2LA0KPiBBTURfSVBfQkxPQ0tfVFlQRV9VVkQsICFlbmFibGUpOw0KPiA+
ICAgCWlmIChyZXQpDQo+ID4gICAJCURSTV9FUlJPUigiRHBtICVzIHV2ZCBmYWlsZWQsIHJldCA9
ICVkLiBcbiIsIEBAIC00NTMsNg0KPiArNDc3LDIxIEBADQo+ID4gdm9pZCBhbWRncHVfZHBtX2Vu
YWJsZV92Y2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKQ0KPiA+ICAg
ew0KPiA+ICAgCWludCByZXQgPSAwOw0KPiA+DQo+ID4gKwlpZiAoYWRldi0+ZmFtaWx5ID09IEFN
REdQVV9GQU1JTFlfU0kpIHsNCj4gPiArCQltdXRleF9sb2NrKCZhZGV2LT5wbS5tdXRleCk7DQo+
ID4gKwkJaWYgKGVuYWJsZSkgew0KPiA+ICsJCQlhZGV2LT5wbS5kcG0udmNlX2FjdGl2ZSA9IHRy
dWU7DQo+ID4gKwkJCS8qIFhYWCBzZWxlY3QgdmNlIGxldmVsIGJhc2VkIG9uIHJpbmcvdGFzayAq
Lw0KPiA+ICsJCQlhZGV2LT5wbS5kcG0udmNlX2xldmVsID0NCj4gQU1EX1ZDRV9MRVZFTF9BQ19B
TEw7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJYWRldi0+cG0uZHBtLnZjZV9hY3RpdmUgPSBm
YWxzZTsNCj4gPiArCQl9DQo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5wbS5tdXRleCk7DQo+
ID4gKw0KPiA+ICsJCWFtZGdwdV9kcG1fY29tcHV0ZV9jbG9ja3MoYWRldik7DQo+ID4gKwkJcmV0
dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgIAlyZXQgPSBhbWRncHVfZHBtX3NldF9wb3dlcmdh
dGluZ19ieV9zbXUoYWRldiwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfVkNFLCAhZW5hYmxlKTsNCj4g
PiAgIAlpZiAocmV0KQ0KPiA+ICAgCQlEUk1fRVJST1IoIkRwbSAlcyB2Y2UgZmFpbGVkLCByZXQg
PSAlZC4gXG4iLCBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2Fj
eS1kcG0vbGVnYWN5X2RwbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1k
cG0vbGVnYWN5X2RwbS5jDQo+ID4gaW5kZXggOTYxM2M2MTgxYzE3Li5kM2ZlMTQ5ZDg0NzYgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL2xlZ2FjeV9k
cG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9sZWdhY3lf
ZHBtLmMNCj4gPiBAQCAtMTAyOCwxNiArMTAyOCw2IEBAIHN0YXRpYyBpbnQNCj4gYW1kZ3B1X2Rw
bV9jaGFuZ2VfcG93ZXJfc3RhdGVfbG9ja2VkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiA+ICAgdm9pZCBhbWRncHVfbGVnYWN5X2RwbV9jb21wdXRlX2Nsb2Nrcyh2b2lkICpoYW5kbGUp
DQo+ID4gICB7DQo+ID4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKiloYW5kbGU7DQo+ID4gLQlpbnQgaSA9IDA7DQo+ID4gLQ0KPiA+IC0JaWYg
KGFkZXYtPm1vZGVfaW5mby5udW1fY3J0YykNCj4gPiAtCQlhbWRncHVfZGlzcGxheV9iYW5kd2lk
dGhfdXBkYXRlKGFkZXYpOw0KPiA+IC0NCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFY
X1JJTkdTOyBpKyspIHsNCj4gPiAtCQlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5y
aW5nc1tpXTsNCj4gPiAtCQlpZiAocmluZyAmJiByaW5nLT5zY2hlZC5yZWFkeSkNCj4gPiAtCQkJ
YW1kZ3B1X2ZlbmNlX3dhaXRfZW1wdHkocmluZyk7DQo+ID4gLQl9DQo+ID4NCj4gPiAgIAlhbWRn
cHVfZHBtX2dldF9hY3RpdmVfZGlzcGxheXMoYWRldik7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lfZHBtLmMNCj4gPiBpbmRleCBjYWFlNTQ0ODdm
OWMuLjYzM2RhYjE0ZjUxYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L2xlZ2FjeS1kcG0vc2lfZHBtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xl
Z2FjeS1kcG0vc2lfZHBtLmMNCj4gPiBAQCAtMzg5Miw0MCArMzg5Miw2IEBAIHN0YXRpYyBpbnQg
c2lfc2V0X2Jvb3Rfc3RhdGUoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4gICB9
DQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+IC1zdGF0aWMgaW50IHNpX3NldF9wb3dlcmdhdGluZ19i
eV9zbXUodm9pZCAqaGFuZGxlLA0KPiA+IC0JCQkJICAgICB1aW50MzJfdCBibG9ja190eXBlLA0K
PiA+IC0JCQkJICAgICBib29sIGdhdGUpDQo+ID4gLXsNCj4gPiAtCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KPiA+IC0NCj4gPiAt
CXN3aXRjaCAoYmxvY2tfdHlwZSkgew0KPiA+IC0JY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9VVkQ6
DQo+ID4gLQkJaWYgKCFnYXRlKSB7DQo+ID4gLQkJCWFkZXYtPnBtLmRwbS51dmRfYWN0aXZlID0g
dHJ1ZTsNCj4gPiAtCQkJYWRldi0+cG0uZHBtLnN0YXRlID0NCj4gUE9XRVJfU1RBVEVfVFlQRV9J
TlRFUk5BTF9VVkQ7DQo+ID4gLQkJfSBlbHNlIHsNCj4gPiAtCQkJYWRldi0+cG0uZHBtLnV2ZF9h
Y3RpdmUgPSBmYWxzZTsNCj4gPiAtCQl9DQo+ID4gLQ0KPiA+IC0JCWFtZGdwdV9sZWdhY3lfZHBt
X2NvbXB1dGVfY2xvY2tzKGhhbmRsZSk7DQo+ID4gLQkJYnJlYWs7DQo+ID4gLQljYXNlIEFNRF9J
UF9CTE9DS19UWVBFX1ZDRToNCj4gPiAtCQlpZiAoIWdhdGUpIHsNCj4gPiAtCQkJYWRldi0+cG0u
ZHBtLnZjZV9hY3RpdmUgPSB0cnVlOw0KPiA+IC0JCQkvKiBYWFggc2VsZWN0IHZjZSBsZXZlbCBi
YXNlZCBvbiByaW5nL3Rhc2sgKi8NCj4gPiAtCQkJYWRldi0+cG0uZHBtLnZjZV9sZXZlbCA9DQo+
IEFNRF9WQ0VfTEVWRUxfQUNfQUxMOw0KPiA+IC0JCX0gZWxzZSB7DQo+ID4gLQkJCWFkZXYtPnBt
LmRwbS52Y2VfYWN0aXZlID0gZmFsc2U7DQo+ID4gLQkJfQ0KPiA+IC0NCj4gPiAtCQlhbWRncHVf
bGVnYWN5X2RwbV9jb21wdXRlX2Nsb2NrcyhoYW5kbGUpOw0KPiA+IC0JCWJyZWFrOw0KPiA+IC0J
ZGVmYXVsdDoNCj4gPiAtCQlicmVhazsNCj4gPiAtCX0NCj4gPiAtCXJldHVybiAwOw0KPiA+IC19
DQo+ID4gLQ0KPiA+ICAgc3RhdGljIGludCBzaV9zZXRfc3dfc3RhdGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+ID4gICB7DQo+ID4gICAJcmV0dXJuIChhbWRncHVfc2lfc2VuZF9tc2df
dG9fc21jKGFkZXYsDQo+IFBQU01DX01TR19Td2l0Y2hUb1N3U3RhdGUpID09IFBQU01DX1Jlc3Vs
dF9PSykgPw0KPiA+IEBAIC04MTI1LDcgKzgwOTEsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFt
ZF9wbV9mdW5jcyBzaV9kcG1fZnVuY3MNCj4gPSB7DQo+ID4gICAJLnByaW50X3Bvd2VyX3N0YXRl
ID0gJnNpX2RwbV9wcmludF9wb3dlcl9zdGF0ZSwNCj4gPiAgIAkuZGVidWdmc19wcmludF9jdXJy
ZW50X3BlcmZvcm1hbmNlX2xldmVsID0NCj4gJnNpX2RwbV9kZWJ1Z2ZzX3ByaW50X2N1cnJlbnRf
cGVyZm9ybWFuY2VfbGV2ZWwsDQo+ID4gICAJLmZvcmNlX3BlcmZvcm1hbmNlX2xldmVsID0gJnNp
X2RwbV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbCwNCj4gPiAtCS5zZXRfcG93ZXJnYXRpbmdfYnlf
c211ID0gJnNpX3NldF9wb3dlcmdhdGluZ19ieV9zbXUsDQo+ID4gICAJLnZibGFua190b29fc2hv
cnQgPSAmc2lfZHBtX3ZibGFua190b29fc2hvcnQsDQo+ID4gICAJLnNldF9mYW5fY29udHJvbF9t
b2RlID0gJnNpX2RwbV9zZXRfZmFuX2NvbnRyb2xfbW9kZSwNCj4gPiAgIAkuZ2V0X2Zhbl9jb250
cm9sX21vZGUgPSAmc2lfZHBtX2dldF9mYW5fY29udHJvbF9tb2RlLCBkaWZmIC0tDQo+IGdpdA0K
PiA+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMNCj4g
PiBpbmRleCBkYmVkNzJjMWUwYzYuLjFlYjRlNjEzYjI3YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMNCj4gPiBAQCAt
MTUwMywxNiArMTUwMyw2IEBAIHN0YXRpYyB2b2lkIHBwX3BtX2NvbXB1dGVfY2xvY2tzKHZvaWQN
Cj4gKmhhbmRsZSkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyID0gaGFu
ZGxlOw0KPiA+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7DQo+
ID4gLQlpbnQgaSA9IDA7DQo+ID4gLQ0KPiA+IC0JaWYgKGFkZXYtPm1vZGVfaW5mby5udW1fY3J0
YykNCj4gPiAtCQlhbWRncHVfZGlzcGxheV9iYW5kd2lkdGhfdXBkYXRlKGFkZXYpOw0KPiA+IC0N
Cj4gPiAtCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1JJTkdTOyBpKyspIHsNCj4gPiAtCQlz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsNCj4gPiAtCQlpZiAocmlu
ZyAmJiByaW5nLT5zY2hlZC5yZWFkeSkNCj4gPiAtCQkJYW1kZ3B1X2ZlbmNlX3dhaXRfZW1wdHko
cmluZyk7DQo+ID4gLQl9DQo+ID4NCj4gPiAgIAlpZiAoIWFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1
cHBvcnQoYWRldikpIHsNCj4gPiAgIAkJYW1kZ3B1X2RwbV9nZXRfYWN0aXZlX2Rpc3BsYXlzKGFk
ZXYpOw0KPiA+DQo=
