Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD436DAE2
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Apr 2021 17:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7E6EB53;
	Wed, 28 Apr 2021 15:12:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA4E6E0F2;
 Wed, 28 Apr 2021 15:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7qm3c+yS4Qd4uv/vJZ2PSf6eRayCEmzQXpyyy6bOjucT3YZ63A0ECQ2LTAz6zDMlIOHI8Vgg4sAvb3m+Uip7ZzH/QMeos8jxj/x9X6/FISASnkIfCPsptPGLOWtIyLzSl1bhNE9VnndvVJrvE9PrzB7RCQ5JyeQmsft5Gq4FNuovUM4I8li0LFwMKSADYS+crCygMNdPaCjVUI0BrbLXyq24ld6E7SCW4c4C7JwCNXG37SK9W31HBPwc3eknbICHySD25QnMiCSeCyd85EwgtOdefyjputVgD+qTGbhP+kzCmKNTBqNsltlsa1UPoMpQWSXQbwtceR0aR4L48ummg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl2b5nLE9+Z7+UTpff5mOu1YIPg5KpeHZYXxyFPi2FA=;
 b=exYtpMc58JJ0h0XWONa2od0ErYd1z034ooCGy3neaSNGMuZvMQYLX/5XdjfCgwY+kvZa9kDEcjperJa8nDgMLXvESG1/YjqjCtkbFGgJX4qsJVN2cOmgxx4MxXFEahZ9vMU+PAo/b8xjovMi61XkejWpRx5CRAqRVXKCOVWwE6Xyd5tDf/oVzIkMXFHeCAyxa1/M9ickiwle0LPciCL/+I6w0XurZS6Uaqia84Qqdv35LePh4TJV1V+563/A9CnAb9qe7IqQRtOyhRNiXpil7igpzvI4lR5E6/zP+p/J3SFLzFipwV4Kk6VwuJmmIDGIBOAc7JuGpbVC5Cym++rtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl2b5nLE9+Z7+UTpff5mOu1YIPg5KpeHZYXxyFPi2FA=;
 b=PYQ4Lq4GnJCkyJg2uw4tCaD0EDOhfRisxAr1ALx34uDzUUJmWmueeodhj0VsQHA4Q21PmgL6m0QqpINyDyhPi5UdVuSFWF9yj1sON/469hskwO4dvVtVQhDnpncDxL0cnnuoaS7SNMLeqwRDmmGyQChk+cx7DH3fPZx50dsgL1E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2799.namprd12.prod.outlook.com (2603:10b6:805:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 15:12:28 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:28 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 00/27] RFC Support hot device unplug in amdgpu
Date: Wed, 28 Apr 2021 11:11:40 -0400
Message-Id: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51124738-2985-432f-33d5-08d90a580957
X-MS-TrafficTypeDiagnostic: SN6PR12MB2799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB279938C7AAD7644024789784EA409@SN6PR12MB2799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5XcGAizoQKpiR87yVi0Nu417O61K6XrMgHeu+H5xUFptbPS6YIIfsGxsLHus/rnO9SptEBpXeVqGXPM17qySe7Nrz13pba3lfE5P/SnMSZXmPdXHDfFsEHWUprN40ep7WOxVktMeSFmGi7aAUTYsqC/PCqPh7B5snZF7qI+JHBf54O34OJAx/HTabQAWv9JM0wKBqk+XccuWAQtiJA5n2ggFwP8c0tiU0fMh5yW57K8fgGIfVzyp/OAGgLwAp0gII7Qk+JzHYglAvDZvRHIGfLCIxm6QzKMC4+Dnpni30I1sLSF7NMrqR3PNKGYVVelUj3P0wlMPRnKlTiSyihoBdGyXAnfLYnC7xHjl0C2zY8GcjHh3Oila5SP0TAEH06CyOKflkSs9ozXDrV4/vtX6AhHVovWl3Fl8Tkk1PuMVaNWWBgS6s03p+B9BiQ7Pkbo1o4531EZw8YylFZRDt3WtiteG5lsScDTiHEkE+YmEIlt6KWWz6tCaiR2wgYMxsjLXrr/qPgAEuhB/acSVKauj1hhv2h3jn368Cch4oIySgrnSgcoxig6yp5RHxPwAyvLGbC9fZ3K/QQukWxisKeomEg6UQz3QHdqenx1AjrsyMmlatzoU94mV2qGr2DYN0jEJ1YbEURt7TETPJ08SB7s4wWRzBQ2BSw1NtPgoOqjtus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(966005)(16526019)(8676002)(4326008)(478600001)(66556008)(66476007)(2616005)(66946007)(86362001)(44832011)(186003)(83380400001)(36756003)(8936002)(316002)(6666004)(1076003)(6636002)(6506007)(52116002)(38100700002)(30864003)(6512007)(5660300002)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3AycExiaDRlSG80K20yOGpmM29XSlVKeG03VjlzSkhuWSt4aEd2cjVLOEh3?=
 =?utf-8?B?UDlRQmtsT0JhYmMwck1FNWc5M1pSYXl0bkxSWVFqYzU5SmM1VFpkempnMmV2?=
 =?utf-8?B?ejJBTDNQTXBzd1Azd2xVcnpwSk9YV2ZLc01MT003NmozTExxdDNCd3I3MEVV?=
 =?utf-8?B?dy9NUlFJcVBZeUowTGdremlvejFwU1NDblZ6Vkk5bnNDb3poV2VlSUtCODV0?=
 =?utf-8?B?VnV1aDdsS0pjMDhEZmJLM2MrWG14cnVvQ3RoQ296T0h1OVV0WTRadXBpVEN6?=
 =?utf-8?B?cHpRZ3h5SFcwNld0V3FLRHpydXYxUHR0clUwRENqbGVRb2dJaWRwVHZDc2sw?=
 =?utf-8?B?NHBta20zUTZNTDl6ekRpWjVkMnVhS0Q0NzBNV1N3VjBaNzRqaERlNHpXUnE4?=
 =?utf-8?B?Z2Q1elpKbGdEai8yQVZ2ZW45Q08rbldKVmxCdDdwN0tWTkw1MFJXNzUxSDVP?=
 =?utf-8?B?djY5enFzYzJoRFZYVlpGTHlxZHpMVWhyVFltSDBRcUtNTjlpUUszZTk5a3la?=
 =?utf-8?B?VkZJUk9DdUQxYUhndFpIa3ZzL1IxSDNIeEpkQk93dnc4dk5TaVVQQlg1RWZx?=
 =?utf-8?B?OXF1WDZkSjJ2MlRCeUoydGlienNEV0FMcnFVL0VLWU05N3Y3aDZZSWlPRXBL?=
 =?utf-8?B?WTdoTktMZkpEZFA1dlk2MlpzckJpRGR0NDdDRVlOcTEwa0lYMlNoY01Ec0lR?=
 =?utf-8?B?TUhPQlkvZDFzdmpwbzA0WGl6UnVEcjltYUZ4czV5MVJtdEloY1lEcnV6dGNG?=
 =?utf-8?B?ZFlmTmV4MWRpaTE1RHRneGtEeDdyeGRiYjMreTNpNDhqTmxOY3BTVnZ0c2VM?=
 =?utf-8?B?T1MyYlZCTytoQkRaNFVQOXo4eWphNGp6czRMWU9oTmRaSTAreGJ0T2dBMTVC?=
 =?utf-8?B?UTNKbnAwNlVqZ2NwRmdQTjQyUFM2SCs0Rk0xL3dOQkgzTlJHTWJTTXBBWUZn?=
 =?utf-8?B?QTBsd3RIdTZlWnlkUzh6bFJHeTArTTFieHRhRzhwK091cU9sbHpESnJZZkRq?=
 =?utf-8?B?Y0hKLzNlenUwanMwdGV6bm1CeE0xN1dXUEQvSzdtbm1SSCtQTnBrSFIvMHR4?=
 =?utf-8?B?ZGlSeDBIcXMxa0FWSzBCODRqbVk4akd5QS9KZ0daTkljQlluaU5uckEzSlA3?=
 =?utf-8?B?MTltc2syZUNYamxrc1dnM01nMnJoWVR6b1E5SzNFeXBBcERheXRYdWRnNXNu?=
 =?utf-8?B?MkFSdUdDQmVQdW4rOGdHd0s1TjhqdXhzUFAycEc2clczWEFRbzNwSVZ0a3Vp?=
 =?utf-8?B?VXlhV01ub2g0MnhWdHRjN3RrWUYzamNQbmhaK2Y3SEhjNzNTMHUrYzZwV0Y2?=
 =?utf-8?B?ZUU0ZXBsL0RGaWlrcDVVNnF1M0xxcThUNGg1UkVPK2lqb2FwSkNEZXBoRzRU?=
 =?utf-8?B?N0hFRFY0aGp2VmhDZHBWanZkVlNldkRBTngrZ1d5VW9oZDF0T25zREttbWtK?=
 =?utf-8?B?bGFGbG53b3o2VCt1SXZORkpERUZnTE9uNC9ZR0FIQWJpS3RRM1ExaUtaNzFn?=
 =?utf-8?B?cGFNb2ZUbDZNZU9vQjY1U1JlN3FFQmxYek1oTVdibC9jV3lhSWhPMTlCazJq?=
 =?utf-8?B?aWRQOWNLRDhQcXVPeVlqbmFxLzVFNU9QMHFGRy9FRWkwaGF4dStmWTJnUHVQ?=
 =?utf-8?B?OXpnV2dCZmpMQnM2Y0E2K3BKR2k2NnVQdlFVL3B1QUtPd21HanZ3LzlkUGRE?=
 =?utf-8?B?S1Q0bnB1cGVqT1A5bkg4VHlVdEt2c2lZV3c1Z1p0dEkzQ1dqY0g5NEhGVkFG?=
 =?utf-8?B?SWx2b0c0TTVtUVBZcU1GSW1UZzN1TnpUUGFoRlBZZG9QRkJYZnVRcGp6bEk3?=
 =?utf-8?B?SEJLMG5LOTh1VHRpMG9iR1hIQ0I4SnR1dVJnallheWJDRkZuWDFpYnFVbU9K?=
 =?utf-8?Q?oyY3BijxQCLYm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51124738-2985-432f-33d5-08d90a580957
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:28.1704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4OrPw7OwHQhBSR87GBJ9mviGMBO39USZwMOZXFCUIDGYAO29stBL+Z6jax/OHQWEttfTumzACuPD2PA/iTbHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2799
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, gregkh@linuxfoundation.org,
 Felix.Kuehling@amd.com, ppaalanen@gmail.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW50aWwgbm93IGV4dHJhY3RpbmcgYSBjYXJkIGVpdGhlciBieSBwaHlzaWNhbCBleHRyYWN0aW9u
IChlLmcuIGVHUFUgd2l0aCAKdGh1bmRlcmJvbHQgY29ubmVjdGlvbiBvciBieSBlbXVsYXRpb24g
dGhyb3VnaCAgc3lmcyAtPiAvc3lzL2J1cy9wY2kvZGV2aWNlcy9kZXZpY2VfaWQvcmVtb3ZlKSAK
d291bGQgY2F1c2UgcmFuZG9tIGNyYXNoZXMgaW4gdXNlciBhcHBzLiBUaGUgcmFuZG9tIGNyYXNo
ZXMgaW4gYXBwcyB3ZXJlIAptb3N0bHkgZHVlIHRvIHRoZSBhcHAgaGF2aW5nIG1hcHBlZCBhIGRl
dmljZSBiYWNrZWQgQk8gaW50byBpdHMgYWRkcmVzcyAKc3BhY2Ugd2FzIHN0aWxsIHRyeWluZyB0
byBhY2Nlc3MgdGhlIEJPIHdoaWxlIHRoZSBiYWNraW5nIGRldmljZSB3YXMgZ29uZS4KVG8gYW5z
d2VyIHRoaXMgZmlyc3QgcHJvYmxlbSBDaHJpc3RpYW4gc3VnZ2VzdGVkIHRvIGZpeCB0aGUgaGFu
ZGxpbmcgb2YgbWFwcGVkIAptZW1vcnkgaW4gdGhlIGNsaWVudHMgd2hlbiB0aGUgZGV2aWNlIGdv
ZXMgYXdheSBieSBmb3JjaWJseSB1bm1hcCBhbGwgYnVmZmVycyB0aGUgCnVzZXIgcHJvY2Vzc2Vz
IGhhcyBieSBjbGVhcmluZyB0aGVpciByZXNwZWN0aXZlIFZNQXMgbWFwcGluZyB0aGUgZGV2aWNl
IEJPcy4gClRoZW4gd2hlbiB0aGUgVk1BcyB0cnkgdG8gZmlsbCBpbiB0aGUgcGFnZSB0YWJsZXMg
YWdhaW4gd2UgY2hlY2sgaW4gdGhlIGZhdWx0IApoYW5kbGVyaWYgdGhlIGRldmljZSBpcyByZW1v
dmVkIGFuZCBpZiBzbywgcmV0dXJuIGFuIGVycm9yLiBUaGlzIHdpbGwgZ2VuZXJhdGUgYSAKU0lH
QlVTIHRvIHRoZSBhcHBsaWNhdGlvbiB3aGljaCBjYW4gdGhlbiBjbGVhbmx5IHRlcm1pbmF0ZS5U
aGlzIGluZGVlZCB3YXMgZG9uZSAKYnV0IHRoaXMgaW4gdHVybiBjcmVhdGVkIGEgcHJvYmxlbSBv
ZiBrZXJuZWwgT09QcyB3ZXJlIHRoZSBPT1BTZXMgd2VyZSBkdWUgdG8gdGhlIApmYWN0IHRoYXQg
d2hpbGUgdGhlIGFwcCB3YXMgdGVybWluYXRpbmcgYmVjYXVzZSBvZiB0aGUgU0lHQlVTaXQgd291
bGQgdHJpZ2dlciB1c2UgCmFmdGVyIGZyZWUgaW4gdGhlIGRyaXZlciBieSBjYWxsaW5nIHRvIGFj
Y2Vzc2VzIGRldmljZSBzdHJ1Y3R1cmVzIHRoYXQgd2VyZSBhbHJlYWR5IApyZWxlYXNlZCBmcm9t
IHRoZSBwY2kgcmVtb3ZlIHNlcXVlbmNlLlRoaXMgd2FzIGhhbmRsZWQgYnkgaW50cm9kdWNpbmcg
YSAnZmx1c2gnIApzZXF1ZW5jZSBkdXJpbmcgZGV2aWNlIHJlbW92YWwgd2VyZSB3ZSB3YWl0IGZv
ciBkcm0gZmlsZSByZWZlcmVuY2UgdG8gZHJvcCB0byAwIAptZWFuaW5nIGFsbCB1c2VyIGNsaWVu
dHMgZGlyZWN0bHkgdXNpbmcgdGhpcyBkZXZpY2UgdGVybWluYXRlZC4KCnYyOgpCYXNlZCBvbiBk
aXNjdXNzaW9ucyBpbiB0aGUgbWFpbGluZyBsaXN0IHdpdGggRGFuaWVsIGFuZCBQZWtrYSBbMV0g
YW5kIGJhc2VkIG9uIHRoZSBkb2N1bWVudCAKcHJvZHVjZWQgYnkgUGVra2EgZnJvbSB0aG9zZSBk
aXNjdXNzaW9ucyBbMl0gdGhlIHdob2xlIGFwcHJvYWNoIHdpdGggcmV0dXJuaW5nIFNJR0JVUyBh
bmQgCndhaXRpbmcgZm9yIGFsbCB1c2VyIGNsaWVudHMgaGF2aW5nIENQVSBtYXBwaW5nIG9mIGRl
dmljZSBCT3MgdG8gZGllIHdhcyBkcm9wcGVkLiAKSW5zdGVhZCBhcyBwZXIgdGhlIGRvY3VtZW50
IHN1Z2dlc3Rpb24gdGhlIGRldmljZSBzdHJ1Y3R1cmVzIGFyZSBrZXB0IGFsaXZlIHVudGlsIAp0
aGUgbGFzdCByZWZlcmVuY2UgdG8gdGhlIGRldmljZSBpcyBkcm9wcGVkIGJ5IHVzZXIgY2xpZW50
IGFuZCBpbiB0aGUgbWVhbndoaWxlIGFsbCBleGlzdGluZyBhbmQgbmV3IENQVSBtYXBwaW5ncyBv
ZiB0aGUgQk9zIApiZWxvbmdpbmcgdG8gdGhlIGRldmljZSBkaXJlY3RseSBvciBieSBkbWEtYnVm
IGltcG9ydCBhcmUgcmVyb3V0ZWQgdG8gcGVyIHVzZXIgCnByb2Nlc3MgZHVtbXkgcncgcGFnZS5B
bHNvLCBJIHNraXBwZWQgdGhlICdSZXF1aXJlbWVudHMgZm9yIEtNUyBVQVBJJyBzZWN0aW9uIG9m
IFsyXSAKc2luY2UgaSBhbSB0cnlpbmcgdG8gZ2V0IHRoZSBtaW5pbWFsIHNldCBvZiByZXF1aXJl
bWVudHMgdGhhdCBzdGlsbCBnaXZlIHVzZWZ1bCBzb2x1dGlvbiAKdG8gd29yayBhbmQgdGhpcyBp
cyB0aGUnUmVxdWlyZW1lbnRzIGZvciBSZW5kZXIgYW5kIENyb3NzLURldmljZSBVQVBJJyBzZWN0
aW9uIGFuZCBzbyBteSAKdGVzdCBjYXNlIGlzIHJlbW92aW5nIGEgc2Vjb25kYXJ5IGRldmljZSwg
d2hpY2ggaXMgcmVuZGVyIG9ubHkgYW5kIGlzIG5vdCBpbnZvbHZlZCAKaW4gS01TLgoKdjM6Ck1v
cmUgdXBkYXRlcyBmb2xsb3dpbmcgY29tbWVudHMgZnJvbSB2MiBzdWNoIGFzIHJlbW92aW5nIGxv
b3AgdG8gZmluZCBEUk0gZmlsZSB3aGVuIHJlcm91dGluZyAKcGFnZSBmYXVsdHMgdG8gZHVtbXkg
cGFnZSxnZXR0aW5nIHJpZCBvZiB1bm5lY2Vzc2FyeSBzeXNmcyBoYW5kbGluZyByZWZhY3Rvcmlu
ZyBhbmQgbW92aW5nIApwcmV2ZW50aW9uIG9mIEdQVSByZWNvdmVyeSBwb3N0IGRldmljZSB1bnBs
dWcgZnJvbSBhbWRncHUgdG8gc2NoZWR1bGVyIGxheWVyLiAKT24gdG9wIG9mIHRoYXQgYWRkZWQg
dW5wbHVnIHN1cHBvcnQgZm9yIHRoZSBJT01NVSBlbmFibGVkIHN5c3RlbS4KCnY0OgpEcm9wIGxh
c3Qgc3lzZnMgaGFjayBhbmQgdXNlIHN5c2ZzIGRlZmF1bHQgYXR0cmlidXRlLgpHdWFyZCBhZ2Fp
bnN0IHdyaXRlIGFjY2Vzc2VzIGFmdGVyIGRldmljZSByZW1vdmFsIHRvIGF2b2lkIG1vZGlmeWlu
ZyByZWxlYXNlZCBtZW1vcnkuClVwZGF0ZSBkdW1teSBwYWdlcyBoYW5kbGluZyB0byBvbiBkZW1h
bmQgYWxsb2NhdGlvbiBhbmQgcmVsZWFzZSB0aHJvdWdoIGRybSBtYW5hZ2VkIGZyYW1ld29yay4K
QWRkIHJldHVybiB2YWx1ZSB0byBzY2hlZHVsZXIgam9iIFRPIGhhbmRsZXIgKGJ5IEx1YmVuIFR1
aWtvdikgYW5kIHVzZSB0aGlzIGluIGFtZGdwdSBmb3IgcHJldmVudGlvbiAKb2YgR1BVIHJlY292
ZXJ5IHBvc3QgZGV2aWNlIHVucGx1ZwpBbHNvIHJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbWV4
dCBpbnN0ZWFkIG9mIGFtZC1zdGFnaW5nLWRybS1uZXh0Cgp2NToKVGhlIG1vc3Qgc2lnbmlmaWNh
bnQgaW4gdGhpcyBzZXJpZXMgaXMgdGhlIGltcHJvdmVkIHByb3RlY3Rpb24gZnJvbSBrZXJuZWwg
ZHJpdmVyIGFjY2Vzc2luZyBNTUlPIHJhbmdlcyB0aGF0IHdlcmUgYWxsb2NhdGVkCmZvciB0aGUg
ZGV2aWNlIG9uY2UgdGhlIGRldmljZSBpcyBnb25lLiBUbyBkbyB0aGlzLCBmaXJzdCBhIHBhdGNo
ICdkcm0vYW1kZ3B1OiBVbm1hcCBhbGwgTU1JTyBtYXBwaW5ncycgaXMgaW50cm9kdWNlZC4KVGhp
cyBwYXRjaCB1bmFtcHMgYWxsIE1NSU8gbWFwcGVkIGludG8gdGhlIGtlcm5lbCBhZGRyZXNzIHNw
YWNlIGluIHRoZSBmb3JtIG9mIEJBUnMgYW5kIGtlcm5lbCBCT3Mgd2l0aCBDUFUgdmlzaWJsZSBW
UkFNIG1hcHBpbmdzLgpUaGlzIHdheSBpdCBoZWxwZWQgdG8gZGlzY292ZXIgbXVsdGlwbGUgc3Vj
aCBhY2Nlc3MgcG9pbnRzIGJlY2F1c2UgYSBwYWdlIGZhdWx0IHdvdWxkIGJlIGltbWVkaWF0ZWx5
IGdlbmVyYXRlZCBvbiBhY2Nlc3MuIE1vc3Qgb2YgdGhlbQp3ZXJlIHNvbHZlZCBieSBtb3Zpbmcg
SFcgZmluaSBjb2RlIGludG8gcGNpX3JlbW92ZSBzdGFnZSAocGF0Y2ggZHJtL2FtZGdwdTogQWRk
IGVhcmx5IGZpbmkgY2FsbGJhY2spIGFuZCBmb3Igc29tZSB3aG8gCndlcmUgaGFyZGVyIHRvIHVu
d2luZCBkcm1fZGV2X2VudGVyL2V4aXQgc2NvcGluZyB3YXMgdXNlZC4gSW4gYWRkaXRpb24gYWxs
IHRoZSBJT0NUTHMgYW5kIGFsbCBiYWNrZ3JvdW5kIHdvcmsgYW5kIHRpbWVycyAKYXJlIG5vdyBw
cm90ZWN0ZWQgd2l0aCBkcm1fZGV2X2VudGVyL2V4aXQgYXQgdGhlaXIgcm9vdCBpbiBhbiBhdHRl
bXB0IHRoYXQgYWZ0ZXIgZHJtX2Rldl91bnBsdWcgaXMgZmluaXNoZWQgbm9uZSBvZiB0aGVtIApy
dW4gYW55bW9yZSBhbmQgdGhlIHBjaV9yZW1vdmUgdGhyZWFkIGlzIHRoZSBvbmx5IHRocmVhZCBl
eGVjdXRpbmcgd2hpY2ggbWlnaHQgdG91Y2ggdGhlIEhXLiBUbyBwcmV2ZW50IGRlYWRsb2NrcyBp
biBzdWNoIApjYXNlIGFnYWluc3QgdGhyZWFkcyBzdHVjayBvbiB2YXJpb3VzIEhXIG9yIFNXIGZl
bmNlcyBwYXRjaGVzICdkcm0vYW1kZ3B1OiBGaW5hbGlzZSBkZXZpY2UgZmVuY2VzIG9uIGRldmlj
ZSByZW1vdmUnIMKgCmFuZCBkcm0vYW1kZ3B1OiBBZGQgcndfc2VtIHRvIHB1c2hpbmcgam9iIGlu
dG8gc2NoZWQgcXVldWUnIHRha2UgY2FyZSBvZiBmb3JjZSBzaWduYWxpbmcgYWxsIHN1Y2ggZXhp
c3RpbmcgZmVuY2VzIAphbmQgcmVqZWN0aW5nIGFueSBuZXdseSBhZGRlZCBvbmVzLgoKV2l0aCB0
aGVzZSBwYXRjaGVzIEkgYW0gYWJsZSB0byBncmFjZWZ1bGx5IHJlbW92ZSB0aGUgc2Vjb25kYXJ5
IGNhcmQgdXNpbmcgc3lzZnMgcmVtb3ZlIGhvb2sgd2hpbGUgZ2x4Z2VhcnMgaXMgcnVubmluZyBv
ZmYgb2Ygc2Vjb25kYXJ5IApjYXJkIChEUklfUFJJTUU9MSkgd2l0aG91dCBrZXJuZWwgb29wc2Vz
IG9yIGhhbmdzIGFuZCBrZWVwIHdvcmtpbmcgd2l0aCB0aGUgcHJpbWFyeSBjYXJkIG9yIHNvZnQg
cmVzZXQgdGhlIGRldmljZSB3aXRob3V0IGhhbmdzIG9yIG9vcHNlcy4KQWxzbyBhcyBwZXIgRGFu
aWVsJ3MgY29tbWVudCBJIGFkZGVkIDMgdGVzdHMgdG8gSUdUIFs0XSB0byBjb3JlX2hvdHVucGx1
ZyB0ZXN0IHN1aXRlIC0gcmVtb3ZlIGRldmljZSB3aGlsZSBjb21tYW5kcyBhcmUgc3VibWl0dGVk
LCAKZXhwb3J0ZWQgQk8gYW5kIGV4cG9ydGVkIGZlbmNlIChub3QgcHVzaGVkIHlldCkuCkFsc28g
bm93IGl0J3MgcG9zc2libGUgdG8gcGx1ZyBiYWNrIHRoZSBkZXZpY2UgYWZ0ZXIgdW5wbHVnIApB
bHNvIHNvbWUgdXNlcnMgbm93IGNhbiBzdWNjZXNzZnVsbHkgdXNlIHRob3NlIHBhdGNoZXMgd2l0
aCBlR1BVIGJveGVzWzNdLgoKCgoKVE9ET3MgZm9yIGZvbGxvd3VwIHdvcms6CkNvbnZlcnQgQU1E
R1BVIGNvZGUgdG8gdXNlIGRldm0gKGZvciBodyBzdHVmZikgYW5kIGRybW0gKGZvciBzdyBzdHVm
ZiBhbmQgYWxsb2NhdGlvbnMpIChEYW5pZWwpCkFkZCBzdXBwb3J0IGZvciAnUmVxdWlyZW1lbnRz
IGZvciBLTVMgVUFQSScgc2VjdGlvbiBvZiBbMl0gLSB1bnBsdWdnaW5nIHByaW1hcnksIGRpc3Bs
YXkgY29ubmVjdGVkIGNhcmQuCgpbMV0gLSBEaXNjdXNzaW9ucyBkdXJpbmcgdjQgb2YgdGhlIHBh
dGNoc2V0IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAy
MS1KYW51YXJ5LzA1ODU5NS5odG1sClsyXSAtIGRybS9kb2M6IGRldmljZSBob3QtdW5wbHVnIGZv
ciB1c2Vyc3BhY2UgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzI1
OTc1NS5odG1sClszXSAtIFJlbGF0ZWQgZ2l0bGFiIHRpY2tldCBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8xMDgxCls0XSAtIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9hZ3JvZHpvdi9pZ3QtZ3B1LXRvb2xzLy0vY29tbWl0cy9tYXN0ZXIKCkFu
ZHJleSBHcm9kem92c2t5ICgyNyk6CiAgZHJtL3R0bTogUmVtYXAgYWxsIHBhZ2UgZmF1bHRzIHRv
IHBlciBwcm9jZXNzIGR1bW15IHBhZ2UuCiAgZHJtL3R0bTogRXhwb3NlIHR0bV90dF91bnBvcHVs
YXRlIGZvciBkcml2ZXIgdXNlCiAgZHJtL2FtZGdwdTogU3BsaXQgYW1kZ3B1X2RldmljZV9maW5p
IGludG8gZWFybHkgYW5kIGxhdGUKICBkcm0vYW1ka2ZkOiBTcGxpdCBrZmQgc3VzcGVuZCBmcm9t
IGRldmllIGV4aXQKICBkcm0vYW1kZ3B1OiBBZGQgZWFybHkgZmluaSBjYWxsYmFjawogIGRybS9h
bWRncHU6IEhhbmRsZSBJT01NVSBlbmFibGVkIGNhc2UuCiAgZHJtL2FtZGdwdTogUmVtYXAgYWxs
IHBhZ2UgZmF1bHRzIHRvIHBlciBwcm9jZXNzIGR1bW15IHBhZ2UuCiAgUENJOiBhZGQgc3VwcG9y
dCBmb3IgZGV2X2dyb3VwcyB0byBzdHJ1Y3QgcGNpX2RldmljZV9kcml2ZXIKICBkbXIvYW1kZ3B1
OiBNb3ZlIHNvbWUgc3lzZnMgYXR0cnMgY3JlYXRpb24gdG8gZGVmYXVsdF9hdHRyCiAgZHJtL2Ft
ZGdwdTogR3VhcmQgYWdhaW5zdCB3cml0ZSBhY2Nlc3NlcyBhZnRlciBkZXZpY2UgcmVtb3ZhbAog
IGRybS9zY2hlZDogTWFrZSB0aW1lb3V0IHRpbWVyIHJlYXJtIGNvbmRpdGlvbmFsLgogIGRybS9h
bWRncHU6IFByZXZlbnQgYW55IGpvYiByZWNvdmVyaWVzIGFmdGVyIGRldmljZSBpcyB1bnBsdWdn
ZWQuCiAgZHJtL2FtZGdwdTogV2hlbiBmaWxpemluZyB0aGUgZmVuY2UgZHJpdmVyLiBzdG9wIHNj
aGVkdWxlciBmaXJzdC4KICBkcm0vYW1kZ3B1OiBGaXggaGFuZyBvbiBkZXZpY2UgcmVtb3ZhbC4K
ICBkcm0vc2NoZWR1bGVyOiBGaXggaGFuZyB3aGVuIHNjaGVkX2VudGl0eSByZWxlYXNlZAogIGRy
bS9hbWRncHU6IFVubWFwIGFsbCBNTUlPIG1hcHBpbmdzCiAgZHJtL2FtZGdwdTogQWRkIHJ3X3Nl
bSB0byBwdXNoaW5nIGpvYiBpbnRvIHNjaGVkIHF1ZXVlCiAgZHJtL3NjaGVkOiBFeHBvc2UgZHJt
X3NjaGVkX2VudGl0eV9raWxsX2pvYnMKICBkcm0vYW1kZ3B1OiBGaW5pbGlzZSBkZXZpY2UgZmVu
Y2VzIG9uIGRldmljZSByZW1vdmUuCiAgZHJtOiBTY29wZSBhbGwgRFJNIElPQ1RMcyAgd2l0aCBk
cm1fZGV2X2VudGVyL2V4aXQKICBkcm0vYW1kZ3B1OiBBZGQgc3VwcG9ydCBmb3IgaG90LXVucGx1
ZyBmZWF0dXJlIGF0IERSTSBsZXZlbC4KICBkcm0vYW1kL2Rpc3BsYXk6IFNjb3BlIGFsbCBETSBx
dWV1ZWQgd29yayB3aXRoIGRybV9kZXZfZW50ZXIvZXhpdAogIGRybS9hbWQvcG93ZXJwbGF5OiBT
Y29wZSBhbGwgUE0gcXVldWVkIHdvcmsgd2l0aCBkcm1fZGV2X2VudGVyL2V4aXQKICBkcm0vYW1k
a2ZkOiBTY29wZSBhbGwgS0ZEIHF1ZXVlZCB3b3JrIHdpdGggZHJtX2Rldl9lbnRlci9leGl0CiAg
ZHJtL2FtZGdwdTogU2NvcGUgYWxsIGFtZGdwdSBxdWV1ZWQgd29yayB3aXRoIGRybV9kZXZfZW50
ZXIvZXhpdAogIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHN1cGVyZmxvdXMgZHJtX21vZGVfY29u
ZmlnX2NsZWFudXAKICBkcm0vYW1kZ3B1OiBWZXJpZnkgRE1BIG9wZWFyYXRpb25zIGZyb20gZGV2
aWNlIGFyZSBkb25lCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAg
ICAgIHwgIDE4ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMg
ICAgfCAgMTMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAg
ICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmMg
IHwgIDE3ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgICAg
fCAgMTMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8
IDM1MyArKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyAgICAgICB8ICAzNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ZlbmNlLmMgICAgIHwgIDM0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2FydC5jICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
YXJ0LmggICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21j
LmMgICAgICAgfCAgIDkgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2d0dF9t
Z3IuYyAgIHwgIDI1ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyAg
ICAgICAgfCAyMjggKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pcnEuYyAgICAgICB8ICA2MSArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pcnEuaCAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5jICAgICAgIHwgIDMzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
anBlZy5jICAgICAgfCAgMjggKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9r
bXMuYyAgICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jICAgIHwgIDQxICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmggICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
ICAgICAgIHwgMTE1ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5oICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyAgICAgICB8ICA1NiArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5n
LmMgICAgICB8ICA3MCArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmlu
Zy5oICAgICAgfCAgNTIgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMgICAgICAgfCAgMjEgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQu
YyAgICAgICB8ICA3NCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNl
LmMgICAgICAgfCAgNDUgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNu
LmMgICAgICAgfCAgODMgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMgICAgICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJh
bV9tZ3IuYyAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19paC5jICAg
ICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYyAgICAg
ICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jICAg
ICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2ljZWxhbmRfaWguYyAg
ICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmMgICAg
ICAgIHwgICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyAgICAg
ICAgfCAgNDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEyXzAuYyAgICAg
ICAgfCAgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMgICAgICAg
ICB8ICAgOCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYyAgICAgICAgICAg
IHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS90b25nYV9paC5jICAgICAgICAg
fCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92NF8wLmMgICAgICAgICB8
ICAyNiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYyAgICAgICAgIHwg
IDIyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyAgICAgICAgfCAg
IDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paC5jICAgICAgICB8ICAg
MiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgICAgIHwgICAz
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50ZXJydXB0LmMgICAgfCAgMTQg
Ky0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAxMyAr
LQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jICAgIHwgMTI0ICsr
Ky0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jIHwgIDI0
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oICAgICAgfCAgIDIg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMgICAgICAgICAgIHwgIDQ0ICsr
LQogLi4uL2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU3X3NtdW1nci5jIHwgICAyICsK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jICAgICB8ICAyNiArLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jICAgICAgICAgICAgICAgICAgIHwgIDE1ICstCiBk
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jICAgICAgfCAgIDYgKy0KIGRy
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jICAgICAgICB8ICAzNSArLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgICAgICAgICAgICAgIHwgIDc5ICsrKy0KIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2
ZXJzL3BjaS9wY2ktZHJpdmVyLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogaW5jbHVk
ZS9kcm0vZHJtX2Rydi5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGluY2x1ZGUv
ZHJtL2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS9saW51
eC9wY2kuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIDY0IGZpbGVzIGNoYW5n
ZWQsIDEzODggaW5zZXJ0aW9ucygrKSwgNjMzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
